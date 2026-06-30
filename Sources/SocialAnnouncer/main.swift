import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

// Announce the day's blog posts on X (OAuth 1.0a) and LinkedIn (Make.com
// webhook). Runs as the final step of the deploy job: detects every post dated
// today (Europe/Madrid) with `publish: true`, one per language, and posts each.
// Pass --dry-run to print the tweets and LinkedIn payloads without posting.

// MARK: - Environment

enum Env {
    static subscript(_ key: String) -> String? {
        let value = ProcessInfo.processInfo.environment[key]
        return (value?.isEmpty ?? true) ? nil : value
    }
}

// MARK: - X API

private let xEndpoint = "https://api.x.com/2/tweets"

struct XResponse: Decodable {
    struct Payload: Decodable { let id: String }
    let data: Payload?
}

func postToX(_ tweet: Tweet, credentials: Credentials) async -> Bool {
    let tag = tweet.locale.uppercased()
    guard let url = URL(string: xEndpoint) else { return false }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue(
        OAuth.authorizationHeader(url: xEndpoint, credentials: credentials),
        forHTTPHeaderField: "Authorization"
    )
    request.httpBody = try? JSONEncoder().encode(["text": tweet.text])

    do {
        let (data, response) = try await URLSession.shared.data(for: request)
        let status = (response as? HTTPURLResponse)?.statusCode ?? 0
        guard (200...299).contains(status) else {
            print("  [\(tag)] Error \(status): \(String(data: data, encoding: .utf8) ?? "")")
            return false
        }
        if let id = (try? JSONDecoder().decode(XResponse.self, from: data))?.data?.id {
            print("  [\(tag)] Tweet posted: id=\(id)")
        }
        return true
    } catch {
        print("  [\(tag)] Request failed: \(error.localizedDescription)")
        return false
    }
}

// MARK: - LinkedIn via Make.com

func postToLinkedIn(_ post: LinkedInPost, webhookURL: String) async -> Bool {
    let tag = post.locale.uppercased()
    guard let url = URL(string: webhookURL) else {
        print("  [\(tag)] Invalid webhook URL")
        return false
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = try? JSONEncoder().encode([
        "text": post.text,
        "url": post.url,
        "title": post.title,
        "thumbnail": post.thumbnail,
    ])

    do {
        let (data, response) = try await URLSession.shared.data(for: request)
        let status = (response as? HTTPURLResponse)?.statusCode ?? 0
        guard (200...299).contains(status) else {
            print("  [\(tag)] LinkedIn error \(status): \(String(data: data, encoding: .utf8) ?? "")")
            return false
        }
        print("  [\(tag)] LinkedIn post sent via webhook")
        return true
    } catch {
        print("  [\(tag)] LinkedIn request failed: \(error.localizedDescription)")
        return false
    }
}

// MARK: - Cover polling

// LinkedIn builds the card from OG tags the moment Make posts, so make sure the
// cover has propagated to Cloudflare first. Best-effort; proceeds after retries.
func waitForCovers(_ urls: [String], retries: Int = 10, interval: UInt64 = 5) async {
    for urlString in Set(urls) {
        guard let url = URL(string: urlString) else { continue }
        for attempt in 1...retries {
            var request = URLRequest(url: url)
            request.httpMethod = "HEAD"
            if let (_, response) = try? await URLSession.shared.data(for: request),
                (response as? HTTPURLResponse)?.statusCode == 200 {
                print("Cover available: \(urlString) (attempt \(attempt))")
                break
            }
            if attempt < retries {
                print("Cover not ready: \(urlString) (attempt \(attempt), retrying in \(interval)s...)")
                try? await Task.sleep(for: .seconds(interval))
            } else {
                print("Cover not available after \(retries) attempts: \(urlString), proceeding anyway")
            }
        }
    }
}

// MARK: - Dry run

func runDryRun(tweets: [Tweet], linkedInPosts: [LinkedInPost]) {
    for tweet in tweets {
        print("\n--- \(tweet.locale.uppercased()) \(tweet.slug) ---")
        print(tweet.text)
        do {
            let credentials = try Credentials.load()
            print("\nAuthorization: \(OAuth.authorizationHeader(url: xEndpoint, credentials: credentials))")
        } catch {
            print("\n(Authorization omitted: \(error))")
        }
    }

    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted, .withoutEscapingSlashes]
    for post in linkedInPosts {
        print("\n--- \(post.locale.uppercased()) \(post.slug) ---")
        if let data = try? encoder.encode(post), let json = String(data: data, encoding: .utf8) {
            print(json)
        }
    }
}

// MARK: - Announce

func announce(tweets: [Tweet], linkedInPosts: [LinkedInPost]) async {
    let credentials = try? Credentials.load()
    if credentials == nil {
        print("X credentials incomplete — skipping X")
    }
    let webhookURL = Env["MAKE_WEBHOOK_URL"]
    if webhookURL == nil {
        print("MAKE_WEBHOOK_URL not set — skipping LinkedIn")
    }

    await waitForCovers(linkedInPosts.map(\.thumbnail))

    await withDiscardingTaskGroup { group in
        if let credentials {
            for tweet in tweets {
                group.addTask {
                    if await !postToX(tweet, credentials: credentials) {
                        print("  Failed: [X] [\(tweet.locale.uppercased())] \(tweet.slug)")
                    }
                }
            }
        }
        if let webhookURL {
            for post in linkedInPosts {
                group.addTask {
                    if await !postToLinkedIn(post, webhookURL: webhookURL) {
                        print("  Failed: [LinkedIn] [\(post.locale.uppercased())] \(post.slug)")
                    }
                }
            }
        }
    }
}

// MARK: - Main

let isDryRun = CommandLine.arguments.contains("--dry-run")
let today = todayInMadrid()
let detected = detectTodaysPosts(today: today)

guard !detected.isEmpty else {
    print("No posts dated \(today) — nothing to announce")
    exit(0)
}

let tweets = detected.map { Tweet(locale: $0.locale, frontmatter: $0.frontmatter) }
let linkedInPosts = detected.map { LinkedInPost(locale: $0.locale, frontmatter: $0.frontmatter) }

for tweet in tweets {
    print("[X] [\(tweet.locale.uppercased())] \(tweet.slug) (\(tweet.text.count) chars)")
}
for post in linkedInPosts {
    print("[LinkedIn] [\(post.locale.uppercased())] \(post.slug)")
}

if isDryRun {
    runDryRun(tweets: tweets, linkedInPosts: linkedInPosts)
    exit(0)
}

await announce(tweets: tweets, linkedInPosts: linkedInPosts)
print("\nDone")

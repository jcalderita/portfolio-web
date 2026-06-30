import Foundation

// Today's date in Madrid as YYYY-MM-DD. en_US_POSIX + a fixed format makes this
// a plain string comparison against frontmatter `date`, dodging offset/midnight
// bugs. Mirrors Node's toLocaleDateString('en-CA', { timeZone: 'Europe/Madrid' }).
private let madridDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = TimeZone(identifier: "Europe/Madrid")
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()

func todayInMadrid() -> String {
    madridDateFormatter.string(from: Date.now)
}

// Posts whose frontmatter `date` equals today and `publish: true` — one entry
// per language file, so a bilingual post yields two. Run by the weekly cron, so
// a post is announced exactly once: on the rebuild that first makes it live.
func detectTodaysPosts(today: String) -> [(locale: String, frontmatter: Frontmatter)] {
    var results: [(locale: String, frontmatter: Frontmatter)] = []
    for locale in ["es", "en"] {
        let directory = URL(filePath: "content/\(locale)/blog/", directoryHint: .isDirectory)
        guard let urls = try? FileManager.default.contentsOfDirectory(
            at: directory, includingPropertiesForKeys: nil
        ) else { continue }
        let markdown = urls
            .filter { $0.pathExtension == "md" }
            .sorted { $0.lastPathComponent < $1.lastPathComponent }
        for url in markdown {
            guard let frontmatter = Frontmatter(path: url.path()) else { continue }
            guard frontmatter.publish == "true", frontmatter.date == today else { continue }
            results.append((locale, frontmatter))
        }
    }
    return results
}

// MARK: - Frontmatter

struct Frontmatter {
    let slug: String
    let title: String
    let description: String
    let tags: [String]
    let cover: String
    let publish: String
    let date: String
    let excerpt: String

    init?(path: String) {
        let url = URL(filePath: path)
        guard let content = try? String(contentsOf: url, encoding: .utf8) else { return nil }

        var fields: [String: String] = [:]
        var inside = false
        var frontmatterEnd = content.startIndex

        for line in content.split(separator: "\n", omittingEmptySubsequences: false) {
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            if trimmed == "---" {
                if inside {
                    frontmatterEnd = line.endIndex
                    break
                }
                inside = true
                continue
            }
            if inside, let colon = line.firstIndex(of: ":") {
                let key = line[line.startIndex..<colon].trimmingCharacters(in: .whitespaces)
                let value = line[line.index(after: colon)...].trimmingCharacters(in: .whitespaces)
                fields[key] = value
            }
        }

        guard let slug = fields["slug"], !slug.isEmpty else { return nil }
        self.slug = slug
        self.title = fields["title"] ?? ""
        self.description = fields["description"] ?? ""
        self.cover = fields["cover"] ?? ""
        self.publish = fields["publish"] ?? ""
        self.date = fields["date"] ?? ""
        self.tags = (fields["tags"] ?? "")
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }
        self.excerpt = Self.extractExcerpt(from: String(content[frontmatterEnd...]), wordCount: 80)
    }
}

private extension Frontmatter {
    static func extractExcerpt(from body: String, wordCount: Int) -> String {
        var text = body
        text = text.replacing(#/<span[^>]*>|<\/span>/#, with: "")
        text = text.replacing(#/\[([^\]]+)\]\([^)]+\)/#, with: { "\($0.output.1)" })
        text = text.replacing(#/(?m)^#{1,6}\s+.*$/#, with: "")
        text = text.replacing(#/(?m)^---$/#, with: "")
        text = text.replacing(#/(?ms)```.*?```/#, with: "")
        text = text.replacing(#/``[^`]+``/#, with: "")
        text = text.replacing(#/\*\*([^*]+)\*\*/#, with: { "\($0.output.1)" })
        text = text.replacing(#/`([^`]+)`/#, with: { "\($0.output.1)" })
        text = text.replacing(#/(?m)\|[^\n]+\|/#, with: "")
        text = text.replacing(#/(?m)^>\s*/#, with: "")
        text = text.replacing(#/(?m)^\d+\.\s+/#, with: "")
        text = text.replacing(#/\n{2,}/#, with: "\n")

        let words = text.split(whereSeparator: \.isWhitespace)
        guard words.count > wordCount else { return words.joined(separator: " ") }
        return words.prefix(wordCount).joined(separator: " ") + "..."
    }
}

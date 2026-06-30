import Foundation

// MARK: - Tweet

struct Tweet {
    let slug: String
    let locale: String
    let text: String

    init(locale: String, frontmatter: Frontmatter) {
        self.slug = frontmatter.slug
        self.locale = locale

        let hashtags = frontmatter.tags.map { "#\($0)" }.joined(separator: " ")
        let url = locale == "es"
            ? "jcalderita.com/es/blog/\(frontmatter.slug)/"
            : "jcalderita.com/blog/\(frontmatter.slug)/"
        self.text = "\(frontmatter.description)\n\n\(url)\n\n\(hashtags)"
    }
}

// MARK: - LinkedIn Post

// Encodable property order (locale, slug, text, url, title, thumbnail) is the
// dry-run print order. The wire body sent to Make is only text/url/title/
// thumbnail — built separately in postToLinkedIn.
struct LinkedInPost: Encodable {
    let locale: String
    let slug: String
    let text: String
    let url: String
    let title: String
    let thumbnail: String

    init(locale: String, frontmatter: Frontmatter) {
        self.locale = locale
        self.slug = frontmatter.slug

        let hashtags = frontmatter.tags.map { "#\($0)" }.joined(separator: " ")
        self.text = "\(frontmatter.description)\n\n\(frontmatter.excerpt)\n\n\(hashtags)"
        self.url = locale == "es"
            ? "https://jcalderita.com/es/blog/\(frontmatter.slug)/"
            : "https://jcalderita.com/blog/\(frontmatter.slug)/"
        self.title = "\(frontmatter.title): \(frontmatter.description)"
        self.thumbnail = "https://jcalderita.com/static/blog/\(frontmatter.cover).webp"
    }
}

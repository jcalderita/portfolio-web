import Foundation
import HTML

// MARK: - Heading extraction + ID injection

struct TocEntry {
    let id: String
    let title: String
    let level: Int
}

// MARK: - TOC rendering

func renderTOC(headings: [TocEntry], locale: Locale) -> Node {
    Node.fragment([
        h2(class: "postTitle") { locale.tableOfContents },
        ol(class: "postIndex") {
            Node.fragment(
                headings.filter { $0.level == 2 }.enumerated().map { idx, entry in
                    li {
                        button(
                            class: "postIndexButton",
                            customAttributes: [
                                "type": "button",
                                "onclick":
                                    "document.getElementById('\(entry.id)')?.scrollIntoView({behavior:'smooth',block:'start'})",
                            ]
                        ) {
                            span(class: "postIndexNumber") { "\(idx + 1)" }
                            entry.title
                        }
                    }
                }
            )
        },
    ])
}

func extractHeadings(from html: String) -> (entries: [TocEntry], html: String) {
    let matches = html.matches(of: /<h([234])>(.*?)<\/h\1>/)
    var entries: [TocEntry] = []
    var result = html

    for match in matches.reversed() {
        let digit = match.output.1
        let title = String(match.output.2)
        let level = Int(digit) ?? 2
        let tag = "h\(digit)"
        let plainTitle = title.replacing(/<[^>]+>/, with: "").decodingHTMLEntities()
        let id = slugify(plainTitle)

        entries.insert(TocEntry(id: id, title: plainTitle, level: level), at: 0)
        result.replaceSubrange(match.range, with: "<\(tag) id=\"\(id)\">\(title)</\(tag)>")
    }

    return (entries, result)
}

// MARK: - Slugify

private func slugify(_ text: String) -> String {
    text.lowercased()
        .replacing(/[^a-z0-9\s-]/, with: "")
        .replacing(/\s+/, with: "-")
        .trimmingCharacters(in: .init(charactersIn: "-"))
}

// MARK: - HTML entity decoding

private extension String {
    func decodingHTMLEntities() -> String {
        let entities: KeyValuePairs<String, String> = [
            "&lt;": "<", "&gt;": ">", "&quot;": "\"",
            "&#39;": "'", "&apos;": "'", "&amp;": "&",
        ]
        return entities.reduce(self) { $0.replacing($1.key, with: $1.value) }
    }
}

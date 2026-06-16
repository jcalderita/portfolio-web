import Foundation
import HTML
import Saga

// MARK: - Cover image

func renderCover(
    metadata: BlogMetadata,
    cssClass: String? = nil,
    extraAttributes: [String: String] = [:]
) -> Node {
    func attrs(_ name: String) -> [String: String] {
        extraAttributes.merging(["src": "/static/blog/\(name).webp", "alt": metadata.coverDescription]) { _, new in new }
    }
    let lightName = "\(metadata.cover)Light"
    guard FileManager.default.fileExists(atPath: "content/static/blog/\(lightName).webp") else {
        return img(class: cssClass, customAttributes: attrs(metadata.cover))
    }
    func cls(_ variant: String) -> String {
        [cssClass, variant].compactMap(\.self).joined(separator: " ")
    }
    return Node.fragment([
        img(class: cls("coverDark"), customAttributes: attrs(metadata.cover)),
        img(class: cls("coverLight"), customAttributes: attrs(lightName)),
    ])
}

// MARK: - Blog card

func renderBlogCard(post: Item<BlogMetadata>, locale: Locale) -> Node {
    let slug = post.metadata.slug

    return a(
        class: "blogCard",
        href: locale.blogPath(for: slug),
        customAttributes: ["aria-label": post.title]
    ) {
        div(class: "blogCardTitle") {
            span { post.title }
        }
        div(class: "blogCardImage") {
            renderCover(
                metadata: post.metadata,
                extraAttributes: [
                    "loading": "lazy",
                    "style": "--vt-name: post-\(slug)",
                ]
            )
        }
        div(class: "blogCardBottom") {
            div(class: "blogCardTags") {
                Node.fragment(post.metadata.tags.map { renderBadge($0, dataInfo: true) })
            }
            p(class: "blogCardDate") { formatDate(post.date, locale: locale) }
        }
    }
}

// MARK: - Tag button

func renderTagButton(tag: String, locale: Locale) -> Node {
    let label = tag == "all" ? locale.allTags : tag

    return button(
        class: "tagButton",
        customAttributes: ["data-tag": tag]
    ) { label }
}

// MARK: - RSS link

func renderRSSLink(locale: Locale) -> Node {
    a(
        class: "rssLink",
        href: locale.feedPath,
        customAttributes: [
            "target": "_blank",
            "rel": "noopener noreferrer",
            "title": locale.subscribeRSS,
            "aria-label": locale.subscribeRSS,
        ]
    ) {
        Node.raw(rssSVG)
        span(class: "rssLabel") { "RSS" }
    }
}

// MARK: - Date formatting

private let cachedFoundationLocales: [Locale: Foundation.Locale] = [
    .en: Foundation.Locale(identifier: "en_US"),
    .es: Foundation.Locale(identifier: "es_ES"),
]

func formatDate(_ date: Date, locale: Locale) -> String {
    date.formatted(
        .dateTime
            .day(.twoDigits).month(.twoDigits).year(.twoDigits)
            .locale(cachedFoundationLocales[locale] ?? .current)
    )
}

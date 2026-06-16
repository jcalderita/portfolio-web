import Foundation
import HTML
import Saga
import SagaSwimRenderer

// MARK: - Page context

struct PageContext {
    let title: String
    let locale: Locale
    let slug: String
    var description: String = ""
    var ogImage: String = "/static/web.webp"
    var ogType: String = "website"
    var articleTags: [String] = []
    var articleDate: Date?
    var noIndex: Bool = false
    var jsonLD: String?
}

// MARK: - Layout

enum LayoutKind {
    case home, blog, blogIndex, legal
}

private extension LayoutKind {
    var isNotMain: Bool { self != .home }

    var mainClass: String {
        switch self {
        case .home: "mainLayout"
        case .blog, .blogIndex: "mainLayout blogMain"
        case .legal: ""
        }
    }

    var scripts: [String] {
        switch self {
        case .home, .legal: [themeToggleJS, hamburgerMenuJS]
        case .blog: [themeToggleJS, hamburgerMenuJS, copyButtonJS]
        case .blogIndex: [themeToggleJS, hamburgerMenuJS, tagFilterJS]
        }
    }
}

func layout(_ context: PageContext, kind: LayoutKind, @NodeBuilder children: () -> NodeConvertible) -> Node {
    html(lang: context.locale.rawValue) {
        renderHead(context)
        body(class: "bodyLayout") {
            renderHeader(locale: context.locale, isNotMain: kind.isNotMain)
            if kind == .legal {
                main {
                    section(class: "legalSection") {
                        h1(class: "legalTitle") { context.title }
                        children()
                    }
                }
            } else {
                main(class: kind.mainClass) {
                    div(class: "contentLayout") {
                        children()
                    }
                }
            }
            renderFooter(locale: context.locale)
            script {
                Node.fragment(kind.scripts.enumerated().flatMap { i, s -> [Node] in
                    i == 0 ? [Node.raw(s)] : [Node.raw("\n"), Node.raw(s)]
                })
            }
        }
    }
}

// MARK: - Head

private func renderHead(_ context: PageContext) -> Node {
    let siteURL = SiteConfig.baseURL.absoluteString
    let ogImageURL = "\(siteURL)\(context.ogImage)"
    let canonicalURL = "\(siteURL)\(context.slug)"
    let desc = context.description

    let baseNodes: [Node] = [
        script { Node.raw(restoreThemeJS) },
        meta(charset: "utf-8"),
        meta(content: "width=device-width, initial-scale=1", name: "viewport"),
        HTML.title { context.title },
        link(href: Saga.hashed("/static/style.css"), rel: "stylesheet"),
        link(href: "/static/favicon.svg", rel: "icon", type: "image/svg+xml"),
        link(href: "/static/favicon.ico", rel: "icon", customAttributes: ["sizes": "any"]),
        link(href: "/static/apple-touch-icon.png", rel: "apple-touch-icon"),
        link(href: "/static/site.webmanifest", rel: "manifest"),
    ]

    let seoMeta: [(content: String, name: String)] = ([
        desc.isEmpty ? nil : (desc, "description"),
        (SiteConfig.author, "author"),
        (context.locale.metaKeywords, "keywords"),
        (context.noIndex ? "noindex, nofollow" : "index, follow", "robots"),
    ] as [(content: String, name: String)?]).compactMap(\.self)

    let ogMeta: [(content: String, property: String)] = ([
        (context.ogType, "og:type"),
        (context.title, "og:title"),
        desc.isEmpty ? nil : (desc, "og:description"),
        (canonicalURL, "og:url"),
        (ogImageURL, "og:image"),
        (context.locale == .es ? "es_ES" : "en_US", "og:locale"),
    ] as [(content: String, property: String)?]).compactMap(\.self)

    let twitterMeta: [(content: String, name: String)] = ([
        ("summary_large_image", "twitter:card"),
        (context.title, "twitter:title"),
        desc.isEmpty ? nil : (desc, "twitter:description"),
        (ogImageURL, "twitter:image"),
        (SiteConfig.twitterHandle, "twitter:site"),
        (SiteConfig.twitterHandle, "twitter:creator"),
    ] as [(content: String, name: String)?]).compactMap(\.self)

    var articleMeta: [(content: String, property: String)] = []
    if let date = context.articleDate {
        articleMeta.append((date.formatted(.iso8601), "article:published_time"))
    }
    articleMeta += context.articleTags.map { ($0, "article:tag") }

    let hreflangLinks: [Node]
    if context.noIndex {
        hreflangLinks = []
    } else {
        let enSlug = context.locale == .en ? context.slug : context.locale.otherPath(for: context.slug)
        let esSlug = context.locale == .es ? context.slug : context.locale.otherPath(for: context.slug)
        hreflangLinks = [
            link(href: "\(siteURL)\(enSlug)", hreflang: "en", rel: "alternate"),
            link(href: "\(siteURL)\(esSlug)", hreflang: "es", rel: "alternate"),
            link(href: "\(siteURL)\(enSlug)", hreflang: "x-default", rel: "alternate"),
        ]
    }

    let jsonLDNodes: [Node] = context.jsonLD.map { js in
        [script(type: "application/ld+json") { Node.raw(js) }]
    } ?? []

    let nodes = baseNodes
        + seoMeta.map { meta(content: $0.content, name: $0.name) }
        + ogMeta.map { meta(content: $0.content, customAttributes: ["property": $0.property]) }
        + twitterMeta.map { meta(content: $0.content, name: $0.name) }
        + articleMeta.map { meta(content: $0.content, customAttributes: ["property": $0.property]) }
        + [link(href: canonicalURL, rel: "canonical")]
        + hreflangLinks
        + jsonLDNodes
        + [
            script(type: "speculationrules") {
                Node.raw("""
                {"prerender":[{"source":"document","where":{"href_matches":"/*"},"eagerness":"moderate"}]}
                """)
            },
            script { Node.raw(prefetchFallbackJS) },
        ]

    return head { Node.fragment(nodes) }
}

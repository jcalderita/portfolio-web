import Foundation
import Saga

// MARK: - llms.txt

/// Renders the site's `llms.txt` (llmstxt.org spec) for Generative Engine Optimization.
///
/// A single file at the site root listing every published post (EN + ES, newest
/// first) so AI tools get a direct question → article map without having to crawl
/// the blog index. Synchronous — like `renderSitemap`.
func renderLLMsTxt(context: PageRenderingContext) -> String {
    let base = SiteConfig.baseURL.absoluteString

    let header = """
    # \(SiteConfig.author)

    > Software developer with 20+ years of experience, specializing in iOS, visionOS, and Swift (client + server). Personal portfolio and technical blog about Swift, Server-Side Swift, SwiftUI, accessibility, and software architecture.

    ## Author

    - Name: \(SiteConfig.author)
    - Role: Software Developer (iOS, visionOS, Swift)
    - Website: \(base)
    - GitHub: \(SiteConfig.githubURL)
    - LinkedIn: \(SiteConfig.linkedinURL)
    - X: \(SiteConfig.xURL)
    - Email: contacto@jcalderita.com

    ## Blog

    Technical articles in Spanish and English about Swift development, Server-Side Swift, iOS patterns, accessibility, database design, and developer tooling.

    - [Blog (English)](\(base)/blog/): All English articles
    - [Blog (Spanish)](\(base)/es/blog/): All Spanish articles
    - [Atom Feed (EN)](\(base)/blog/feed.xml): English RSS feed
    - [Atom Feed (ES)](\(base)/es/blog/feed.xml): Spanish RSS feed
    """

    let footer = """
    ## Key Topics

    Swift, Vapor, Server-Side Swift, PostgreSQL, Concurrency, Async/Await, AI coding tools, iOS, visionOS, Accessibility, Testing, Static Site Generation, Shell scripting

    ## Optional

    - [Sitemap](\(base)/sitemap.xml): Complete site map
    """

    // `registerBlog` already filters by `publish`, so every blog item is a
    // published post; `compactMap` discards the `Item<LegalMetadata>` entries.
    let articles = context.allItems
        .compactMap { $0 as? Item<BlogMetadata> }
        .sorted { $0.date > $1.date }
        .map { "- [\($0.title)](\(base)\($0.url)): \($0.metadata.description)" }
        .joined(separator: "\n")

    return """
    \(header)

    ## Articles

    \(articles)

    \(footer)
    """
}

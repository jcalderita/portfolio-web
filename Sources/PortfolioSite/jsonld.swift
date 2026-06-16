import Foundation

// MARK: - Schemas

private struct PersonLD: Encodable {
    let context = "https://schema.org"
    let type = "Person"
    let name: String
    let jobTitle: String
    let description: String
    let url: String
    let image: String
    let sameAs: [String]
    let email: String
    let knowsAbout: [String]
    enum CodingKeys: String, CodingKey {
        case context = "@context", type = "@type"
        case name, jobTitle, description, url, image, sameAs, email, knowsAbout
    }
}

private struct PersonRef: Encodable {
    let type = "Person"
    let name: String
    let url: String
    enum CodingKeys: String, CodingKey { case type = "@type", name, url }
}

private struct BlogPostingLD: Encodable {
    let context = "https://schema.org"
    let type = "BlogPosting"
    let headline: String
    let description: String
    let datePublished: Date
    let url: String
    let image: String
    let author: PersonRef
    let publisher: PersonRef
    let keywords: [String]
    let inLanguage: String
    enum CodingKeys: String, CodingKey {
        case context = "@context", type = "@type"
        case headline, description, datePublished, url, image, author, publisher, keywords, inLanguage
    }
}

// MARK: - Encoding

private func encodeJSONLD<T: Encodable>(_ value: T) -> String {
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
    encoder.dateEncodingStrategy = .iso8601
    guard let data = try? encoder.encode(value) else { return "{}" }
    return String(decoding: data, as: UTF8.self)
}

// MARK: - Builders

func buildPersonJsonLD(
    name: String, jobTitle: String, description: String, url: String,
    sameAs: [String], email: String, knowsAbout: [String]
) -> String {
    encodeJSONLD(PersonLD(
        name: name, jobTitle: jobTitle, description: description, url: url,
        image: "\(url)/static/web.webp", sameAs: sameAs, email: email, knowsAbout: knowsAbout
    ))
}

func buildBlogPostingJsonLD(
    headline: String, description: String, datePublished: Date, url: String,
    imageURL: String, authorName: String, authorURL: String,
    keywords: [String], inLanguage: String
) -> String {
    let person = PersonRef(name: authorName, url: authorURL)
    return encodeJSONLD(BlogPostingLD(
        headline: headline, description: description, datePublished: datePublished,
        url: url, image: imageURL, author: person, publisher: person,
        keywords: keywords, inLanguage: inLanguage
    ))
}

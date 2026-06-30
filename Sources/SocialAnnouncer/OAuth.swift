import Foundation

// MARK: - Credentials

struct Credentials {
    let apiKey: String
    let apiSecret: String
    let accessToken: String
    let accessSecret: String
}

extension Credentials {
    enum LoadError: Error, CustomStringConvertible {
        case missing(String)
        var description: String {
            switch self {
            case .missing(let key): return "missing \(key)"
            }
        }
    }

    static func load() throws -> Credentials {
        Credentials(
            apiKey: try require("X_API_KEY"),
            apiSecret: try require("X_API_SECRET"),
            accessToken: try require("X_ACCESS_TOKEN"),
            accessSecret: try require("X_ACCESS_TOKEN_SECRET")
        )
    }
}

private extension Credentials {
    static func require(_ key: String) throws -> String {
        guard let value = Env[key] else { throw LoadError.missing(key) }
        return value
    }
}

// MARK: - OAuth 1.0a

enum OAuth {
    static func authorizationHeader(
        url: String,
        method: String = "POST",
        credentials: Credentials
    ) -> String {
        let params: [(String, String)] = [
            ("oauth_consumer_key", credentials.apiKey),
            ("oauth_nonce", UUID().uuidString.replacing("-", with: "")),
            ("oauth_signature_method", "HMAC-SHA1"),
            ("oauth_timestamp", "\(Int(Date.now.timeIntervalSince1970))"),
            ("oauth_token", credentials.accessToken),
            ("oauth_version", "1.0"),
        ]

        let paramString = params
            .sorted { $0.0 < $1.0 }
            .map { "\(percentEncode($0.0))=\(percentEncode($0.1))" }
            .joined(separator: "&")

        let baseString = [method, percentEncode(url), percentEncode(paramString)].joined(separator: "&")
        let signingKey = [percentEncode(credentials.apiSecret), percentEncode(credentials.accessSecret)].joined(separator: "&")
        let signature = Data(HMACSHA1.sign(key: Array(signingKey.utf8), message: Array(baseString.utf8)))
            .base64EncodedString()

        return "OAuth " + (params + [("oauth_signature", signature)])
            .sorted { $0.0 < $1.0 }
            .map { #"\#($0.0)="\#(percentEncode($0.1))""# }
            .joined(separator: ", ")
    }
}

private extension OAuth {
    // Unreserved set = alphanumerics + "-._~", matching Node's encodeURIComponent
    // followed by escaping ! * ' ( ). All signed values are ASCII, so the
    // Unicode-aware alphanumerics set never diverges from encodeURIComponent.
    static func percentEncode(_ string: String) -> String {
        var allowed = CharacterSet.alphanumerics
        allowed.insert(charactersIn: "-._~")
        return string.addingPercentEncoding(withAllowedCharacters: allowed) ?? string
    }
}

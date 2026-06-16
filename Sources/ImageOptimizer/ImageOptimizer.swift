import Foundation
import Subprocess

// MARK: - ImageOptimizer

public struct ImageOptimizer: Sendable {
    public struct Config: Sendable {
        let inputDir: URL
        let outputDir: URL
        let maxWidth: Int
        let quality: Float
    }

    let config: Config

    public init(config: Config = .blog) {
        self.config = config
    }

    public func run() async throws {
        try FileManager.default.createDirectory(
            at: config.outputDir, withIntermediateDirectories: true)

        let images = try pngFiles(in: config.inputDir)
        let results = await withTaskGroup(of: ProcessResult.self, returning: [ProcessResult].self) { group in
            for file in images {
                group.addTask { await processImage(file, config: config) }
            }
            var results: [ProcessResult] = []
            for await result in group {
                results.append(result)
            }
            return results
        }

        for result in results {
            switch result {
            case .processed(let source, let destination, let size):
                print("  \(source) -> \(destination) (\(size))")
            case .failed(let source):
                print("  Failed: \(source)")
            case .skipped:
                break
            }
        }

        let processed = results.count { if case .processed = $0 { true } else { false } }
        let skipped = results.count { if case .skipped = $0 { true } else { false } }

        print("\nDone! Processed: \(processed), Skipped (up-to-date): \(skipped)")
    }
}

// MARK: - Config presets

extension ImageOptimizer.Config {
    public static let blog = Self(
        inputDir: URL(filePath: "assets/blog/images"),
        outputDir: URL(filePath: "content/static/blog"),
        maxWidth: 800,
        quality: 80
    )
}

// MARK: - ProcessResult

enum ProcessResult: Sendable {
    case processed(source: String, destination: String, size: String)
    case skipped
    case failed(source: String)
}

// MARK: - Processing (free functions for Sendable safety)

private func processImage(_ file: URL, config: ImageOptimizer.Config) async -> ProcessResult {
    let name = file.deletingPathExtension().lastPathComponent
    let dest = config.outputDir.appending(path: "\(name).webp")

    guard !isUpToDate(source: file, destination: dest) else { return .skipped }

    let arguments: [String] = [
        "-quiet",
        "-q", String(Int(config.quality)),
        "-resize", String(config.maxWidth), "0",
        file.path(percentEncoded: false),
        "-o", dest.path(percentEncoded: false),
    ]

    do {
        let result = try await run(
            .name("cwebp"),
            arguments: Arguments(arguments),
            output: .discarded,
            error: .string(limit: 4096)
        )
        guard case .exited(0) = result.terminationStatus else {
            return .failed(source: file.lastPathComponent)
        }
    } catch {
        return .failed(source: file.lastPathComponent)
    }

    return .processed(
        source: file.lastPathComponent,
        destination: "\(name).webp",
        size: fileSize(dest)
    )
}

// MARK: - File helpers

private func pngFiles(in directory: URL) throws -> [URL] {
    guard FileManager.default.fileExists(atPath: directory.path) else { return [] }
    return try FileManager.default.contentsOfDirectory(
        at: directory, includingPropertiesForKeys: nil
    )
    .filter { $0.pathExtension.lowercased() == "png" }
    .sorted { $0.lastPathComponent < $1.lastPathComponent }
}

private func isUpToDate(source: URL, destination: URL) -> Bool {
    guard FileManager.default.fileExists(atPath: destination.path),
        let srcDate = modificationDate(of: source),
        let dstDate = modificationDate(of: destination)
    else { return false }

    return dstDate >= srcDate
}

private func modificationDate(of url: URL) -> Date? {
    try? url.resourceValues(forKeys: [.contentModificationDateKey]).contentModificationDate
}

private func fileSize(_ url: URL) -> String {
    (try? url.resourceValues(forKeys: [.fileSizeKey]).fileSize?.formatted(.byteCount(style: .file))) ?? "?"
}

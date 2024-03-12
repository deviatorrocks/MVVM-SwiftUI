import Foundation

// MARK: - News
struct News: Decodable {
    let status: String
    let source: String
    let sortBy: String
    let articles: [Article]
}

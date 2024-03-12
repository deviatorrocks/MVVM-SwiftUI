import Foundation

// MARK: - Article
struct Article: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
}

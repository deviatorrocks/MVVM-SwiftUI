import Foundation

protocol APIServiceProtocol {
    var articles: Published<[Article]>.Publisher { get }
    var jsonDecoder: JSONDecoder { get set }
    func fetchArticles()
}

class Constants{
    public static let API_KEY = "49ebd3af68eb43b489889fcc58af7dff"
    public static let BASE_URL = "https://newsapi.org/v1/articles?source=techcrunch"
}

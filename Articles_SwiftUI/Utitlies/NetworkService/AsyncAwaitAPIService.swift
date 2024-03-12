import Foundation

class APIServiceWithAsyncAwait: APIServiceProtocol {
    @Published private(set) var articlesList = [Article]()
    
    var articles: Published<[Article]>.Publisher { $articlesList }
    var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    func fetchArticles() {
    }
    
    func fetchArticlesWithAsyncAwait() async throws {
        let routeUrl = "\(Constants.BASE_URL)&apiKey=\(Constants.API_KEY)"
        do {
            let (data, response) = try await URLSession.shared.data(from: URL(string: routeUrl)!)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode >= 200, httpResponse.statusCode <= 299 else {
                throw ArticleError.invalidStatusCode
            }
            
            let jsonDecoder = JSONDecoder()
            guard let localArticles = try? jsonDecoder.decode(News.self, from: data) else {
                throw ArticleError.failedToDecode
            }
            
            self.articlesList = localArticles.articles
        } catch {
            throw ArticleError.customError(error: NSError(domain: "articles.com", code: 1234))
        }
    }
}

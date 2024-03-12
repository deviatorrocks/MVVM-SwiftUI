import Foundation
import Combine

class CombineAPIService: ObservableObject, APIServiceProtocol {
    @Published private(set) var articlesList = [Article]()
    
    var articles: Published<[Article]>.Publisher { $articlesList }
    
    var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    private var anyCancellable: Set<AnyCancellable> = []
    
    func fetchArticles() {
        let routeUrl = "\(Constants.BASE_URL)&apiKey=\(Constants.API_KEY)"
        let request = URLRequest(url: URL(string: routeUrl)!)
        return URLSession.shared.dataTaskPublisher(for: request)
            .compactMap({ $0.data })
            .decode(type: News.self, decoder: jsonDecoder)
            .map{ $0.articles }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .sink { [unowned self] value in
                self.articlesList = value
            }
            .store(in: &anyCancellable)
    }
}

import Foundation
import Combine
@MainActor
class HomeViewModel: ObservableObject {
    @Published var articles = [Article]()
    @Published var searchText: String = ""
    @Published var error: ArticleError?
    
    // Change type to ProtocolType if need to test the Combine approach.
    var service: APIServiceWithAsyncAwait = APIServiceWithAsyncAwait()
    //var service: CombineAPIService = CombineAPIService()
    var cancellable: AnyCancellable?
    
    init() {
        //performArticlesFetchUsingCombine()
        fetchUsingAsyncAwait()
    }
}

// MARK: - Using Async-await make API call.
extension HomeViewModel {
    private func fetchUsingAsyncAwait() {
        Task {
            await fetchAsyncArticles()
            articles = service.articlesList
        }
    }
    
    private func fetchAsyncArticles() async {
        do {
            try await service.fetchArticlesWithAsyncAwait()
        } catch {
            if let articleError = error as? ArticleError {
                self.error = articleError
            }
        }
    }
}

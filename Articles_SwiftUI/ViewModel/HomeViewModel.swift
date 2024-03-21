import Foundation
import Combine
@MainActor
class HomeViewModel: ObservableObject {
    @Published var articles = [Article]()
    @Published var searchText: String = ""
    @Published var error: ArticleError?
    
    var value = GenericStack<Int>()
    
    // Change type to ProtocolType if need to test the Combine approach.
    var service: APIServiceWithAsyncAwait = APIServiceWithAsyncAwait()
    var group = DispatchGroup()
    //var service: CombineAPIService = CombineAPIService()
    var cancellable: AnyCancellable?
    
    init() {
        //performArticlesFetchUsingCombine()
        fetchUsingAsyncAwait()
        loadTasks()
        value.push(item: 10)
        value.push(item: 12)
        value.push(item: 13)
        
        
        //Open close principle
        let shapes: [Shape] = [Circle(radius: 12.0), Rectangle(length: 12, breadth: 15)]
        for item in shapes {
            print(item.calculateArea())
        }
        
        //Liskou principle
        let ostrich = Ostrich()
        let eagle = Eagle()
        
        ostrich.fly()
        eagle.fly()
    }
}

// MARK: - Using Async-await make API call.
extension HomeViewModel {
    private func fetchUsingAsyncAwait() {
        Task {
            let response = await service.fetchArticlesWithAsyncAwait()
            self.articles = response.0
        }
    }
}


extension HomeViewModel {
    private func performTask(taskNumber: Int) {
        group.enter()
        print("Task \(taskNumber) started")
        
        DispatchQueue.global().async { [weak self] in
            Thread.sleep(forTimeInterval: Double.random(in: 1...3))
            
            self?.group.leave()
            print("Task \(taskNumber) finished")
        }
    }
    
    func loadTasks() {
        for i in 0...5 {
            performTask(taskNumber: i)
        }
        
        group.notify(queue: .main) {
            print("All task finished")
        }
    }
}

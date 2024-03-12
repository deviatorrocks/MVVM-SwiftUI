import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(viewModel.articles, id: \.title) { route in
                    NavigationLink(
                        destination: ArticleDetailsView(
                            urlToImage: route.urlToImage,
                            title: route.title,
                            author: route.author)) {
                            SearchItemView(
                                urlToImage: route.urlToImage,
                                title: route.title)
                    }
                }
            }
            .navigationTitle("Articles")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

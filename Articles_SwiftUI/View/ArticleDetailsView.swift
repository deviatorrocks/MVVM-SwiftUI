import SwiftUI

struct ArticleDetailsView: View {
    @State private(set) var urlToImage: String?
    @State private(set) var title: String?
    @State private(set) var author: String?
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    if let urlToImage = urlToImage {
                        CustomImageView(urlString: urlToImage, size: .banner)
                    }
                }
                if let title = title {
                    Text(title)
                        .font(.headline)
                }
                if let author = author {
                    Text("Author name: \(author)")
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
        }
    }
}

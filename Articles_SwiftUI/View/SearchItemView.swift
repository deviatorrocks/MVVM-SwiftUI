import SwiftUI

struct SearchItemView: View {
    @State private(set) var urlToImage: String?
    @State private(set) var title: String?
    
    var body: some View {
        ZStack {
            HStack() {
                if let urlToImage = urlToImage {
                    CustomImageView(urlString: urlToImage)
                }
                if let title = title {
                    Text(title)
                        .font(.headline)
                }
            }
        }
    }
}

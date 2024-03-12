import SwiftUI

enum ImageSize {
    case thumbnail
    case banner
    
    func getFrameSize() -> CGSize {
        switch self {
        case .thumbnail:
            return CGSize(width: 75, height: 75)
        case .banner:
            return CGSize(width: 325, height: 325)
        }
    }
}
struct CustomImageView: View {
    private(set) var urlString: String
    private(set) var size: ImageSize = .thumbnail
    
    @ObservedObject private var imageLoader = ImageLoaderService()
    @State private var image: UIImage = UIImage()
    
    var body: some View {
        let size = size.getFrameSize()
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size.width, height: size.height)
            .onReceive(imageLoader.$image) { image in
                self.image = image
            }
            .onAppear {
                imageLoader.loadImage(for: urlString)
            }
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView(urlString:" https://techcrunch.com/wp-content/uploads/2024/03/twitch-reflection.jpg?resize=75,75")
    }
}

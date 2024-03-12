import Foundation

enum ArticleError: LocalizedError {
    case customError(error: Error)
    case failedToDecode
    case invalidStatusCode
}

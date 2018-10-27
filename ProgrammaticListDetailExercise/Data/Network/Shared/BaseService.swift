import Foundation
import UIKit

class BaseService {
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()

    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
}

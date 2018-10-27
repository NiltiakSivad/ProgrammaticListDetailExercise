import Foundation
import Moya

enum OffersEndpoint {
    case get
}

extension OffersEndpoint: TargetType {
    var headers: [String: String]? {
        return nil
    }

    // Should abstract out API urls to environment variables in xcconfig
    var baseURL: URL { return URL(string: "https://api.myjson.com/bins/")! }

    var path: String {
        switch self {
        case .get:
            return "dn9zm"
        }
    }

    var method: Moya.Method {
        switch self {
        case .get:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .get:
            return .requestPlain
        }
    }
}

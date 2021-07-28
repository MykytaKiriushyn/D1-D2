import Foundation
import Moya

struct Coins: Codable {
    let id: Int
    let date: String
    let currency: Double
    let country: String
    let shortName: String
}

struct Title: Codable {
    let rendered: String
}
// MARK: - Responses

struct CoinsResponse: Codable {
    let coins: [Coins]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        coins = try container.decode([Coins].self)
    }
    
    init(coins: [Coins]) {
        self.coins = coins
    }
}

enum CoinsApi {
    case get
}

// MARK: - TargetType
extension CoinsApi: TargetType {

    var baseURL: URL {
        guard let baseURL = URL(string: "http://\(ApiDomain.api.rawValue)/") else {
            fatalError("Failed to build base url")
        }

        return baseURL
    }

    var path: String {
        switch self {
        case .get:
            return "coins"
        }
    }

    var method: Moya.Method {
        .get
    }

    var task: Task {
        switch self {
        case .get:
            return .requestPlain
        }
    }

    var validationType: ValidationType {
        .successCodes
    }

    var headers: [String: String]? {
        [:]
    }
}

// MARK: - TargetTypeExtension
extension CoinsApi: TargetTypeExtension {

    var sampleApiResult: Encodable {
        switch self {
        case .get:
            return CoinsResponse(coins: [])
        }
    }
}

// MARK: - AccessTokenAuthorizable
extension CoinsApi: AccessTokenAuthorizable {

    var authorizationType: AuthorizationType? {
        .none
    }
}


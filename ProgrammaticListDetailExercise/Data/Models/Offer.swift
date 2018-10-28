import Foundation

struct Offer: Decodable {
    var identifier: String?
    var url: String?
    var name: String?
    var description: String?
    var terms: String?
    var currentValue: String?

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case url
        case name
        case description
        case terms
        case currentValue
    }
}

import Foundation

class UserDefaultsRepository {

    static func getOfferFavorited(offerId: String) -> Bool {
        return UserDefaults.standard.bool(forKey: "offerId: \(offerId)")
    }

    static func setOfferFavorited(offerId: String, value: Bool) {
        UserDefaults.standard.set(value, forKey: "offerId: \(offerId)")
    }
}

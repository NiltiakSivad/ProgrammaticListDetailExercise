import Foundation

struct OfferViewModel: Equatable {
    var identifier: String?
    var url: String?
    var name: String?
    var description: String?
    var terms: String?
    var currentValue: String?

    var favorited: Bool {
        get {
            guard let identifier = identifier else { return false }
            return UserDefaultsRepository.getOfferFavorited(offerId: identifier)
        }
        set {
            guard let identifier = identifier else { return }
            UserDefaultsRepository.setOfferFavorited(offerId: identifier, value: newValue)
        }
    }

    init(offer: Offer) {
        identifier = offer.identifier
        url = offer.url
        name = offer.name
        description = offer.description
        terms = offer.terms
        currentValue = offer.currentValue
    }
}

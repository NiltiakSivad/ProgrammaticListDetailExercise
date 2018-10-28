import Foundation

struct OfferListViewModel {
    var offers = [OfferViewModel]()

    init(offers: [Offer]) {
        self.offers = offers.map { offer in
            return OfferViewModel(offer: offer)
            }.sorted(by: { (offer1, offer2) -> Bool in
                return offer1.name ?? "" < offer2.name ?? ""
            })
    }

    func getOffer(at index: Int) -> OfferViewModel? {
        if offers.count > index {
            return offers[index]
        }
        return nil
    }
}

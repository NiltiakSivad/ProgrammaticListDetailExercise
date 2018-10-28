import Foundation
import RxSwift

class OffersRepository {
    let offersService = OffersService()

    func getOffers() -> Observable<OfferListViewModel> {
        return offersService.get().map { offers in
            return OfferListViewModel(offers: offers)
        }
    }
}

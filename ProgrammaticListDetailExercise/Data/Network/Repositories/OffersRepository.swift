import Foundation
import RxSwift

class OffersRepository {
    let offersService = OffersService()

    func getOffers() -> Observable<[Offer]> {
        return offersService.get().map { offers in
            return offers
        }
    }
}

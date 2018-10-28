import Foundation
import RxSwift

class OfferListPresenter {
    private let offersRepository = OffersRepository()
    private var view: OfferListViewable!
    private let disposeBag = DisposeBag()

    init(_ view: OfferListViewable) {
        self.view = view
    }

    func loadOffers() {
        offersRepository.getOffers()
            .subscribe(onNext: { offers in
                self.view.showOffers(offers)
            }, onError: { _ in
                self.view.showError()
            })
            .disposed(by: disposeBag)
    }
}

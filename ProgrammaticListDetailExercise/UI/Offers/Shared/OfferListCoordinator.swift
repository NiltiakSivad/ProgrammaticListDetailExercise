import Foundation
import UIKit

class OfferListCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let offerListVC = OfferListViewController(collectionViewLayout: UICollectionViewFlowLayout())
        offerListVC.delegate = self
        offerListVC.title = "Offers"
        navigationController.pushViewController(offerListVC, animated: false)
    }
}

protocol OfferListControllerDelegate: class {
    func didSelectOffer(_ offer: OfferViewModel)
}

extension OfferListCoordinator: OfferListControllerDelegate {
    func didSelectOffer(_ offer: OfferViewModel) {
        let offerDetailVC = OfferDetailViewController()
        offerDetailVC.selectedOffer = offer
        offerDetailVC.title = offer.name
        navigationController.pushViewController(offerDetailVC, animated: true)
    }
}

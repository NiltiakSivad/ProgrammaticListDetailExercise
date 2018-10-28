import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var navigationController = UINavigationController()

    var offerListCoordinator: OfferListCoordinator

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
        offerListCoordinator = OfferListCoordinator(navigationController: navigationController)
    }

    func start() {
        window.rootViewController = navigationController
        offerListCoordinator.start()
        window.makeKeyAndVisible()
    }
}

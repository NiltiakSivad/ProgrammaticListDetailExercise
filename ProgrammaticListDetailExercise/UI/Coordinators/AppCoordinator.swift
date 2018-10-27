import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()

    var navigationController = UINavigationController()

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        navigationController.pushViewController(OffersListViewController(), animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

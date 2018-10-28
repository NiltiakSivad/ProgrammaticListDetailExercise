import Foundation
import UIKit

class OfferListViewController: UICollectionViewController {

    var presenter: OfferListPresenter?

    var viewModel: OfferListViewModel?

    weak var delegate: OfferListControllerDelegate?

    var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = OfferListPresenter(self)
        presenter?.loadOffers()

        collectionView.backgroundColor = .white
        collectionView.register(OfferCollectionViewCell.self,
                                forCellWithReuseIdentifier: OfferCollectionViewCell.reuseId)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = selectedIndexPath {
            collectionView.reloadItems(at: [selectedIndexPath])
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let offer = viewModel?.getOffer(at: indexPath.row) {
            selectedIndexPath = indexPath
            delegate?.didSelectOffer(offer)
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.offers.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCollectionViewCell.reuseId,
                                                         for: indexPath) as? OfferCollectionViewCell,
            let offer = viewModel?.getOffer(at: indexPath.row) {
            cell.setOffer(offer)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension OfferListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: OfferStyle.verticalEdgePadding,
                            left: OfferStyle.horizontalEdgePadding,
                            bottom: OfferStyle.verticalEdgePadding,
                            right: OfferStyle.horizontalEdgePadding)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Create two rows of elements subtracting out spacing to get final cell width
        let edgePadding = OfferStyle.horizontalEdgePadding * 2
        let elementSpacing = OfferStyle.minimumInteritemSpacing
        let cellDimension = (collectionView.bounds.width - edgePadding - elementSpacing)/2
        return CGSize(width: cellDimension, height: cellDimension)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return OfferStyle.lineSpacing
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return OfferStyle.minimumInteritemSpacing
    }
}

extension OfferListViewController: OfferListViewable {
    func showError() {
        let alert = UIAlertController(title: "Oops",
                                      message: "Looks like we are unable to load offers, please try again later.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        present(alert, animated: true)
    }

    func showOffers(_ offers: OfferListViewModel) {
        viewModel = offers
        collectionView.reloadData()
    }
}

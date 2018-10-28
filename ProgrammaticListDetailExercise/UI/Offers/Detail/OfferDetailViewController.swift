import Foundation
import UIKit

class OfferDetailViewController: UIViewController {

    var selectedOffer: OfferViewModel?

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var imageView: AsyncUIImageView = {
        var imageView = AsyncUIImageView()
        if let urlString = selectedOffer?.url {
            imageView.loadImageFrom(url: urlString)
        } else {
            imageView.image = #imageLiteral(resourceName: "placeholder")
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var cashBackLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = selectedOffer?.currentValue
        label.font = ApplicationFont.normalBold.value
        label.textColor = ApplicationColor.textColor.value
        label.numberOfLines = 0
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = selectedOffer?.description
        label.font = ApplicationFont.normalRegular.value
        label.textColor = ApplicationColor.textColor.value
        label.numberOfLines = 0
        return label
    }()

    private lazy var termsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = selectedOffer?.terms
        label.font = ApplicationFont.normalRegular.value
        label.textColor = ApplicationColor.textColor.value
        label.numberOfLines = 0
        return label
    }()

    private lazy var favoriteButton: ToggleButton = {
        var button = ToggleButton()
        button.delegate = self
        button.accessibilityIdentifier = "offerFavoriteButton"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = ApplicationColor.starFavorited.value
        button.isSelected = selectedOffer?.favorited ?? false
        button.setImages(checkedImage: #imageLiteral(resourceName: "ic_star_selected"), uncheckedImage: #imageLiteral(resourceName: "ic_star_unselected"))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayoutConstraints()
    }

    private func setLayoutConstraints() {
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        contentView.addSubview(imageView)

        imageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                       constant: OfferStyle.verticalEdgePadding).isActive = true
        imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 2/3).isActive = true
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4).isActive = true

        contentView.addSubview(cashBackLabel)

        cashBackLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12).isActive = true
        cashBackLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: OfferStyle.horizontalEdgePadding).isActive = true
        contentView.trailingAnchor.constraint(equalTo: cashBackLabel.trailingAnchor,
                                                constant: OfferStyle.horizontalEdgePadding).isActive = true

        contentView.addSubview(descriptionLabel)

        descriptionLabel.topAnchor.constraint(equalTo: cashBackLabel.bottomAnchor, constant: 12).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: cashBackLabel.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: cashBackLabel.trailingAnchor).isActive = true

        contentView.addSubview(termsLabel)

        termsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12).isActive = true
        termsLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).isActive = true
        termsLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor).isActive = true
        termsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        contentView.addSubview(favoriteButton)
        favoriteButton.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        favoriteButton.leadingAnchor.constraint(equalTo: cashBackLabel.leadingAnchor).isActive = true
        favoriteButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/9).isActive = true
        favoriteButton.heightAnchor.constraint(equalTo: favoriteButton.widthAnchor).isActive = true
    }
}

extension OfferDetailViewController: ToggleButtonDelegate {
    func toggleButtonClicked(_ button: ToggleButton) {
        selectedOffer?.favorited = button.isSelected
    }
}

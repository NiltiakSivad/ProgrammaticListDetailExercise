import Foundation
import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    static let reuseId = "offerCell"

    private let imageView: AsyncUIImageView = {
        let imageView = AsyncUIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var backgroundSquareView: UIView = {
        let view = UIView()
        view.backgroundColor = ApplicationColor.itemBackdrop.value
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = ApplicationFont.smallRegular.value
        label.textColor = ApplicationColor.textColor.value
        return label
    }()

    private lazy var cashBackLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = ApplicationFont.smallBold.value
        label.textColor = ApplicationColor.textColor.value
        return label
    }()

    private lazy var favoriteImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "favoriteStatusImage"
        imageView.tintColor = ApplicationColor.starFavorited.value
        imageView.image = #imageLiteral(resourceName: "ic_star_selected")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayoutConstraints()
    }

    private func setLayoutConstraints() {
        contentView.addSubview(backgroundSquareView)

        backgroundSquareView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        backgroundSquareView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        backgroundSquareView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        let heightToWidthRatio: CGFloat = 2/3
        backgroundSquareView.heightAnchor.constraint(equalTo: backgroundSquareView.widthAnchor,
                                                     multiplier: heightToWidthRatio).isActive = true
        backgroundSquareView.addSubview(imageView)

        imageView.topAnchor.constraint(equalTo: backgroundSquareView.topAnchor, constant: 6).isActive = true
        imageView.leadingAnchor.constraint(equalTo: backgroundSquareView.leadingAnchor, constant: 6).isActive = true
        imageView.trailingAnchor.constraint(equalTo: backgroundSquareView.trailingAnchor, constant: -6).isActive = true
        imageView.bottomAnchor.constraint(equalTo: backgroundSquareView.bottomAnchor, constant: -6).isActive = true

        contentView.addSubview(nameLabel)
        contentView.addSubview(cashBackLabel)

        cashBackLabel.leadingAnchor.constraint(equalTo: backgroundSquareView.leadingAnchor).isActive = true
        cashBackLabel.topAnchor.constraint(equalTo: backgroundSquareView.bottomAnchor, constant: 8).isActive = true
        backgroundSquareView.trailingAnchor.constraint(equalTo: cashBackLabel.trailingAnchor).isActive = true

        nameLabel.leadingAnchor.constraint(equalTo: backgroundSquareView.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: cashBackLabel.bottomAnchor, constant: 3).isActive = true
        backgroundSquareView.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true

        contentView.addSubview(favoriteImageView)
        favoriteImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        favoriteImageView.widthAnchor.constraint(equalTo: backgroundSquareView.widthAnchor,
                                              multiplier: 1/5).isActive = true

        favoriteImageView.heightAnchor.constraint(equalTo: favoriteImageView.widthAnchor).isActive = true

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        imageView.image = #imageLiteral(resourceName: "placeholder")
    }

    func setOffer(_ offer: OfferViewModel) {
        nameLabel.text = offer.name
        cashBackLabel.text = offer.currentValue

        if let urlString = offer.url {
            imageView.loadImageFrom(url: urlString)
        }

        favoriteImageView.isHidden = !offer.favorited
    }
}

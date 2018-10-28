import Foundation
import UIKit

protocol ToggleButtonDelegate: class {
    func toggleButtonClicked(_ button: ToggleButton)
}

class ToggleButton: UIButton {

    weak var delegate: ToggleButtonDelegate?

    var checkedImage: UIImage?
    var uncheckedImage: UIImage?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(buttonClicked), for: UIControl.Event.touchDown)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setImages(checkedImage: UIImage,
                   uncheckedImage: UIImage) {
        self.checkedImage = checkedImage.withRenderingMode(.alwaysTemplate)
        self.setImage(checkedImage, for: UIControl.State.selected)

        self.uncheckedImage = uncheckedImage.withRenderingMode(.alwaysTemplate)
        self.setImage(uncheckedImage, for: UIControl.State.normal)
    }

    @objc func buttonClicked() {
        self.isSelected = !self.isSelected
        delegate?.toggleButtonClicked(self)
    }
}

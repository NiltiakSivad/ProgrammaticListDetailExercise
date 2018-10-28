import UIKit
import Nuke

class AsyncUIImageView: UIImageView {
    func loadImageFrom(url: String) {
        if let url = URL(string: url) {

            // Nuke image pipeline: https://github.com/kean/Nuke#h_design
            Nuke.loadImage(with: url, into: self)
        }
    }
}

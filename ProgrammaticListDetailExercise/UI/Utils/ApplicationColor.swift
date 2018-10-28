import Foundation
import UIKit

enum ApplicationColor {
    case itemBackdrop
    case starFavorited
    case textColor
}

extension ApplicationColor {
    var value: UIColor {
        var instanceColor: UIColor?

        switch self {
        case .itemBackdrop:
            instanceColor = UIColor(named: "itemBackdrop")
        case .starFavorited:
            instanceColor = UIColor(named: "starFavorited")
        case .textColor:
            instanceColor = UIColor(named: "textColor")
        }
        return instanceColor ?? .black
    }
}

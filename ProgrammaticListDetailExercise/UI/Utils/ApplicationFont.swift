import Foundation
import UIKit

enum ApplicationFont {
    case smallBold
    case smallRegular
    case normalBold
    case normalRegular
}

extension ApplicationFont {
    var value: UIFont {
        var instanceFont: UIFont?

        switch self {
        case .smallBold:
            instanceFont = UIFont(name: "AvenirNext-DemiBold", size: 12.0)
        case .smallRegular:
            instanceFont = UIFont(name: "AvenirNext-Regular", size: 11.0)
        case .normalBold:
            instanceFont = UIFont(name: "AvenirNext-DemiBold", size: 14.0)
        case .normalRegular:
            instanceFont = UIFont(name: "AvenirNext-Regular", size: 13.0)
        }
        return instanceFont ?? UIFont.preferredFont(forTextStyle: .body)
    }
}

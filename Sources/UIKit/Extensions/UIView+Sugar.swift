//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit

public extension UIView {

    convenience init(backgroundColor: UIColor) {
        self.init()
        self.backgroundColor = backgroundColor
    }

    func isHitTestAvailable(for point: CGPoint?, with event: UIEvent?) -> Bool {
        guard isUserInteractionEnabled,
              isHidden == false,
              alpha > 0.01 else {
            return false
        }
        guard let point = point else {
            return true
        }
        return self.point(inside: point, with: event)
    }

    func layout() {
        setNeedsLayout()
        layoutIfNeeded()
    }
}

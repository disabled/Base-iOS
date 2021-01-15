//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit.UIGeometry

public extension CGSize {

    static func - (lhs: CGSize, rhs: UIEdgeInsets) -> CGSize {
        return CGSize(width: lhs.width - rhs.left - rhs.right,
                      height: lhs.height - rhs.top - rhs.bottom)
    }

    static func + (lhs: CGSize, rhs: UIEdgeInsets) -> CGSize {
        return CGSize(width: lhs.width + rhs.left + rhs.right,
                      height: lhs.height + rhs.top + rhs.bottom)
    }
}

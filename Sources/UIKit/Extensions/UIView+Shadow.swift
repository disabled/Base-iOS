//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit

public extension UIView {

    func setupShadow(radius: CGFloat,
                     offsetX: CGFloat,
                     offsetY: CGFloat,
                     opacity: Float,
                     color: UIColor = .black,
                     path: CGPath? = nil) {
        layer.shadowRadius = radius
        layer.shadowOffset = .init(width: offsetX, height: offsetY)
        layer.shadowOpacity = opacity
        layer.shadowColor = color.cgColor
        layer.shadowPath = path
    }

    func replicateShadow(of view: UIView) {
        layer.shadowRadius = view.layer.shadowRadius
        layer.shadowOffset = view.layer.shadowOffset
        layer.shadowOpacity = view.layer.shadowOpacity
        layer.shadowColor = view.layer.shadowColor
        layer.shadowPath = view.layer.shadowPath
    }
}

//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit
import Framezilla

public class ATRButton: UIButton {

    public var touchRadiusInsets: UIEdgeInsets = 10

    override public func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        bounds.inset(by: -touchRadiusInsets).contains(point)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

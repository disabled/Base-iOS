//
//  Copyright © 2018 Rosberry. All rights reserved.
//

import CoreGraphics

extension CGRect {

    public var aspect: CGFloat {
        return width / height
    }

    // MARK: - Initializers

    public init(filling target: CGRect, aspect: CGFloat) {
        self.init(origin: .zero, size: CGSize(width: aspect, height: 1.0))
        fill(rect: target)
    }

    public init(fitting target: CGRect, aspect: CGFloat) {
        self.init(origin: .zero, size: CGSize(width: aspect, height: 1.0))
        fit(rect: target)
    }

    // MARK: - Helpers

    private func scaleToFit(rect: CGRect) -> CGFloat {
        let scale = rect.width / width
        if height * scale <= rect.height {
            return scale
        }

        return rect.height / height
    }

    private func scaleToFill(rect: CGRect) -> CGFloat {
        return 1.0 / rect.scaleToFit(rect: self)
    }

    // MARK: - Fit

    public mutating func fit(rect: CGRect) {
        let scale = scaleToFit(rect: rect)
        size.width = width * scale
        size.height = height * scale
        origin.x = rect.midX - width / 2.0
        origin.y = rect.midY - height / 2.0
    }

    public func fitting(rect: CGRect) -> CGRect {
        var result = self
        result.fit(rect: rect)
        return result
    }

    // MARK: - Fill

    public mutating func fill(rect: CGRect) {
        let scale = scaleToFill(rect: rect)
        size.width = width * scale
        size.height = height * scale
        origin.x = rect.midX - width / 2.0
        origin.y = rect.midY - height / 2.0
    }

    public func filling(rect: CGRect) -> CGRect {
        var result = self
        result.fill(rect: rect)
        return result
    }
}

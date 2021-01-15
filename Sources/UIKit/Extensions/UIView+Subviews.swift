//
//  Copyright © 2018 Rosberry. All rights reserved.
//

import UIKit

public extension UIView {

    /// Adds a views to the end of the receiver’s list of subviews.
    ///
    /// - Parameter subviews: The views to be added.
    func add(_ subviews: [UIView]) {
        subviews.forEach(addSubview)
    }

    /// Adds a views to the end of the receiver’s list of subviews.
    ///
    /// - Parameter subviews: The views to be added.
    func add(_ subviews: UIView...) {
        add(subviews)
    }

    /// Inserts a subview at the specified index.
    ///
    /// - Parameters:
    ///   - view: The view to insert.
    ///   - index: The index in the array of the subviews property at which to insert the view.
    /// Subview indices start at 0 and cannot be greater than the number of subviews.
    func insert(_ view: UIView, atIndex index: Int) {
        insertSubview(view, at: index)
    }

    /// Inserts a view below another view in the view hierarchy.
    ///
    /// - Parameters:
    ///   - view: The view to insert below another view.
    ///   - subview: The subview that will be above the inserted view.
    func insert(_ view: UIView, below subview: UIView) {
        insertSubview(view, belowSubview: subview)
    }

    /// Inserts a view above another view in the view hierarchy.
    ///
    /// - Parameters:
    ///   - view: The view to insert above another view.
    ///   - subview: The subview that will be below the inserted view.
    func insert(_ view: UIView, above subview: UIView) {
        insertSubview(view, aboveSubview: subview)
    }

    /// Unlinks the view from receiver and its window, and removes it from the responder chain.
    ///
    /// - Parameter view: The subview that will be removed.
    func remove(_ view: UIView) {
        guard view.superview === self else {
            return
        }
        view.removeFromSuperview()
    }

    /// Unlinks the views from receiver and its window, and removes it from the responder chain.
    ///
    /// - Parameter subviews: The subviews that will be removed.
    func remove(_ subviews: [UIView]) {
        subviews.forEach(remove)
    }

    /// Unlinks the views from receiver and its window, and removes it from the responder chain.
    ///
    /// - Parameter subviews: The subviews that will be removed.
    func remove(_ subviews: UIView...) {
        remove(subviews)
    }
}

public extension Collection where Element: UIView {

    /// Unlinks the views from receiver and its window, and removes it from the responder chain.
    func removeFromSuperview() {
        forEach { element in
            element.removeFromSuperview()
        }
    }
}

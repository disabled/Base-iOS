//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

public extension UIAlertController {

    /// Creates and returns a view controller for displaying an alert to the user.
    /// - Parameters:
    ///   - title: The title of the alert. Use this string to get the user’s attention and communicate the reason for the alert.
    ///   - message: Descriptive text that provides additional details about the reason for the alert.
    ///   - preferredStyle: The style to use when presenting the alert controller.
    ///   - actions: The action objects to display as part of the alert.
    convenience init(title: String?, message: String?, preferredStyle: UIAlertController.Style, actions: [UIAlertAction]) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        add(actions)
    }

    /// Attaches an action object to the alert or action sheet.
    /// - Parameters:
    ///   - title: The text to use for the button title.
    ///   - style: Additional styling information to apply to the button. Default is default.
    ///   - handler: A block to execute when the user selects the action. Default is nil.
    func addAction(title: String?, style: UIAlertAction.Style = .default, handler: ((UIAlertAction) -> Void)? = nil) {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        add(action)
    }

    /// Attaches an action object to the alert or action sheet.
    /// - Parameter action: The action object to display as part of the alert.
    func add(_ action: UIAlertAction) {
        addAction(action)
    }

    /// Attaches an action objects to the alert or action sheet.
    /// - Parameter actions: The action objects to display as part of the alert.
    func add(_ actions: UIAlertAction...) {
        add(actions)
    }

    /// Attaches an action objects to the alert or action sheet.
    /// - Parameter actions: The action objects to display as part of the alert.
    func add(_ actions: [UIAlertAction]) {
        actions.forEach(add)
    }
}

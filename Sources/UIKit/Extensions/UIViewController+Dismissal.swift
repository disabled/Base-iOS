//
//  Copyright © 2018 Rosberry. All rights reserved.
//

import UIKit.UIViewController

public extension UIViewController {

    // Dismisses view controller that is being presented by this view controller and dismissal is not in progress yet
    func dismissDescendant(animated: Bool, completion: (() -> Void)? = nil) {
        if let presentedViewController = presentedViewController, !presentedViewController.isBeingDismissed {
            dismiss(animated: animated, completion: completion)
        }
        else {
            completion?()
        }
    }
}

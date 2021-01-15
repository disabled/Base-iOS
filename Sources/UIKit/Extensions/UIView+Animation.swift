//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit

public extension UIView {

    func setAlpha(_ alpha: CGFloat,
                  animated: Bool,
                  animationDuration: TimeInterval = 0.2,
                  completion: ((_ finished: Bool) -> Void)? = nil) {
        layer.removeAllAnimations()
        if animated {
            UIView.animate(withDuration: animationDuration, animations: {
                self.alpha = alpha
            }, completion: { finished in
                completion?(finished)
            })
        }
        else {
            self.alpha = alpha
            completion?(true)
        }
    }

    func setHiddenIfNeeded(_ isHidden: Bool,
                           animated: Bool,
                           animationDuration: TimeInterval = 0.3,
                           completion: ((_ finished: Bool) -> Void)? = nil) {
        guard alpha != (isHidden ? 0 : 1) ||
            self.isHidden != isHidden else {
            return
        }
        setHidden(isHidden, animated: animated, animationDuration: animationDuration, completion: completion)
    }

    func setHidden(_ isHidden: Bool,
                   animated: Bool,
                   animationDuration: TimeInterval = 0.3,
                   completion: ((_ finished: Bool) -> Void)? = nil) {
        layer.removeAllAnimations()
        if animated {
            if isHidden {
                UIView.animate(withDuration: animationDuration, animations: {
                    self.alpha = 0
                }, completion: { finished in
                    if finished {
                        self.isHidden = isHidden
                        self.alpha = 1
                    }
                    completion?(finished)
                })
            }
            else {
                alpha = 0
                self.isHidden = false
                UIView.animate(withDuration: animationDuration, animations: {
                    self.alpha = 1
                }, completion: { finished in
                    completion?(finished)
                })
            }
        }
        else {
            self.isHidden = isHidden
            alpha = isHidden ? 0 : 1
            completion?(true)
        }
    }

    func setHidden(_ isHidden: Bool,
                   animated: Bool,
                   animationDuration: TimeInterval = 0.3,
                   animation: @escaping () -> Void,
                   completion: ((_ finished: Bool) -> Void)? = nil) {
        layer.removeAllAnimations()
        if animated {
            if isHidden {
                UIView.animate(withDuration: animationDuration, animations: {
                    animation()
                }, completion: { finished in
                    if finished {
                        self.isHidden = true
                    }
                    completion?(finished)
                })
            }
            else {
                self.isHidden = false
                UIView.animate(withDuration: animationDuration, animations: {
                    animation()
                }, completion: { finished in
                    completion?(finished)
                })
            }
        }
        else {
            self.isHidden = isHidden
            animation()
            completion?(true)
        }
    }
}

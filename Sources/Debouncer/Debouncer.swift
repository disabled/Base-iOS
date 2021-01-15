//
//  Copyright © 2018 Rosberry. All rights reserved.
//

import Foundation

final public class Debouncer {

    public var delay: TimeInterval
    public var queue: DispatchQueue = .main
    public var shouldCancelIntermediateExecutions: Bool = false

    private var callback: (() -> Void)?
    private var pendingItem: DispatchWorkItem?
    private var isWaiting: Bool = false

    public init(delay: TimeInterval = 1.0 / 30.0) {
        self.delay = delay
    }

    public func async(callback: @escaping () -> Void) {
        defer {
            self.callback = callback
        }

        if shouldCancelIntermediateExecutions {
            isWaiting = true
            pendingItem?.cancel()
        }
        else {
            guard self.callback == nil else {
                isWaiting = true
                return
            }

            callback()
        }

        let item = DispatchWorkItem {
            if self.isWaiting {
                self.callback?()
                self.isWaiting = false
            }

            self.callback = nil
            self.pendingItem = nil
        }
        queue.asyncAfter(deadline: .now() + delay, execute: item)
        pendingItem = item
    }
}

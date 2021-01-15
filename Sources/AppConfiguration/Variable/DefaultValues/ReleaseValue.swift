//
// Copyright (c) 2018 Rosberry. All rights reserved.
//

import Foundation

/// Based on build configuration only.
/// Condition will be met for non-debug builds
/// Useful for cases like registering for push notifications.
/// So server will always know which gate must be used for a build.
public final class ReleaseValue<T>: ConditionValue<T> {
    public init(value: T) {
        super.init(value: value) {
            switch BuildConfiguration() {
            case .appStore,
                 .adhoc:
                return true
            case .debug:
                return false
            }
        }
    }
}

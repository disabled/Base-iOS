//
// Copyright (c) 2018 Rosberry. All rights reserved.
//

import Foundation

/// Based on build configuration only.
/// Condition will be met for AppStore builds only
/// Always set it on top of values list in variable.
public final class AppStoreValue<T>: ConditionValue<T> {
    public init(value: T) {
        super.init(value: value) {
            return BuildConfiguration() == .appStore
        }
    }
}

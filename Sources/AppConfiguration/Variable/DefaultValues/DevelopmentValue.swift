//
// Copyright (c) 2018 Rosberry. All rights reserved.
//

import Foundation

/// Based on build configuration only.
/// Condition will be met for non-AppStore builds.
/// Useful for cases like analytics. So for all non-AppStore
/// builds events will be sent to another place
public final class DevelopmentValue<T>: ConditionValue<T> {
    public init(value: T) {
        super.init(value: value) {
            return BuildConfiguration() != .appStore
        }
    }
}

//
// Copyright (c) 2018 Rosberry. All rights reserved.
//

import Foundation

/// Based on server configuration only.
/// Condition will be met for development server
public final class DevelopmentServerValue<T>: ConditionValue<T> {
    public init(value: T) {
        super.init(value: value) {
            return ServerConfiguration() == .development
        }
    }
}

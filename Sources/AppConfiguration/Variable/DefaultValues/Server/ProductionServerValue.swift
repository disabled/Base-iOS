//
// Copyright (c) 2018 Rosberry. All rights reserved.
//

import Foundation

/// Based on server configuration only.
/// Condition will be met for production server
public final class ProductionServerValue<T>: ConditionValue<T> {
    public init(value: T) {
        super.init(value: value) {
            return ServerConfiguration() == .production
        }
    }
}

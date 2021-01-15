//
// Copyright (c) 2018 Rosberry. All rights reserved.
//

import Foundation

/// Always returns true. Use it as else branch
public final class ConcreteValue<T>: ConditionValue<T> {
    public init(value: T) {
        super.init(value: value) {
            return true
        }
    }
}

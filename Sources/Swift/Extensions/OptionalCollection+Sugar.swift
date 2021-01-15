//
//  Copyright © 2018 Rosberry. All rights reserved.
//

public extension Optional where Wrapped: Collection {

    /// Returns true or false whether collection is nil or empty.
    var isNilOrEmpty: Bool {
        switch self {
        case .some(let wrapped):
            return wrapped.isEmpty
        case .none:
            return true
        }
    }
}

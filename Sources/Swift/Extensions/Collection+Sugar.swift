//
//  Copyright © 2018 Rosberry. All rights reserved.
//

public extension Collection {

    /// Returns collection of objects in accordance with passed type.
    func filter<T>(byType: T.Type) -> [T] {
        return compactMap { element in
            if let element = element as? T {
                return element
            }
            return nil
        }
    }
}

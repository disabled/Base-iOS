//
//  Copyright © 2018 Rosberry. All rights reserved.
//

public extension Array {

    /// Removes element that has specific value at certain keypath.
    mutating func removeFirst<T: Equatable>(with value: T, at keyPath: KeyPath<Element, T>) {
        let indexOrNil = firstIndex { innerElement -> Bool in
            return innerElement[keyPath: keyPath] == value
        }
        if let index = indexOrNil {
            remove(at: index)
        }
    }

    /// Removes element that has value at certain keypath equal to value at keypath of passed element.
    mutating func removeFirst<T: Equatable>(by keyPath: KeyPath<Element, T>, of element: Element) {
        let indexOrNil = firstIndex { innerElement -> Bool in
            return innerElement[keyPath: keyPath] == element[keyPath: keyPath]
        }
        if let index = indexOrNil {
            remove(at: index)
        }
    }
}

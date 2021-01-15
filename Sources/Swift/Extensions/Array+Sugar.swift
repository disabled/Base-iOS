//
//  Copyright © 2018 Rosberry. All rights reserved.
//

public extension Array where Element: Equatable {

    /// Returns array of unique elements sorted with the same order as in source array.
    var unique: [Element] {
        var uniqueElements: [Element] = []
        forEach { item in
            if !uniqueElements.contains(item) {
                uniqueElements += [item]
            }
        }
        return uniqueElements
    }

    /// Removes passed element from array if it exists.
    mutating func removeFirst(_ element: Element) {
        if let index = firstIndex(where: { evaluated in
            return evaluated == element
        }) {
            remove(at: index)
        }
    }
}

public extension Array {

    /// Returns element at index if such index exists, or nil otherwise.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

    /// Removes element that satisfies the condition returned by predicate closure.
    mutating func removeFirst(where predicate: (Element) -> Bool) {
        if let index = firstIndex(where: predicate) {
            remove(at: index)
        }
    }
}

//
//  Copyright © 2018 Rosberry. All rights reserved.
//

import Foundation

public extension String {

    /// Returns substring located in range from given index to end index of string.
    func substring(fromIndex index: Int) -> String {
        let start = self.index(startIndex, offsetBy: index)
        return String(self[start..<endIndex])
    }

    /// Returns substring located in range from start index of string to given index.
    func substring(toIndex index: Int) -> String {
        let end = self.index(startIndex, offsetBy: index)
        return String(self[startIndex..<end])
    }

    /// Returns substring located in given range.
    func substring(withRange range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: range.startIndex)
        let end = index(startIndex, offsetBy: range.endIndex)
        return String(self[start..<end])
    }
}

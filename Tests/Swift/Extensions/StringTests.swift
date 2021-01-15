//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
import Base

final class StringTests: XCTestCase {

    func testSubstringFromIndex() {
        // Given
        let string = "123456789"
        // When
        let substring = string.substring(fromIndex: 5)
        // Then
        XCTAssertEqual(substring, "6789", "Data should be equal because substring started from 5 index")
    }

    func testSubstringToIndex() {
        // Given
        let string = "123456789"
        // When
        let substring = string.substring(toIndex: 5)
        // Then
        XCTAssertEqual(substring, "12345", "Data should be equal because substring ended at 5 index")
    }

    func testSubstringWithRange() {
        // Given
        let string = "123456789"
        // When
        let substring = string.substring(withRange: 3..<8)
        // Then
        XCTAssertEqual(substring, "45678", "Data should be equal because substring is range from 3 to 8 inclusive")
    }
}

//
// Copyright © 2020 Rosberry. All rights reserved.
//

import XCTest
import UIKit
import Base

final class ConcreteValueTests: XCTestCase {

    func testTrueValue() {
        let trueValue = ConcreteValue(value: true)
        XCTAssertTrue(trueValue.value)
        XCTAssertTrue(trueValue.condition())
    }

    func testFalseValue() {
        let falseValue = ConcreteValue(value: false)
        XCTAssertFalse(falseValue.value)
        XCTAssertTrue(falseValue.condition())
    }
}

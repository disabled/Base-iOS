//
// Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit
import XCTest
import Base

final class ConditionValueTests: XCTestCase {

    func testValueWithTrueCondition() {
        let trueValue = ConditionValue(value: true) {
            true
        }
        XCTAssertTrue(trueValue.value)
        let falseValue = ConditionValue(value: false) {
            true
        }
        XCTAssertFalse(falseValue.value)
    }

    func testValueWithFalseCondition() {
        let trueValue = ConditionValue(value: true) {
            false
        }
        XCTAssertTrue(trueValue.value)
        let falseValue = ConditionValue(value: false) {
            false
        }
        XCTAssertFalse(falseValue.value)
    }

    func testTrueCondition() {
        let trueValue = ConditionValue(value: true) {
            true
        }
        XCTAssertTrue(trueValue.condition())
        let falseValue = ConditionValue(value: false) {
            true
        }
        XCTAssertTrue(falseValue.condition())
    }

    func testFalseCondition() {
        let value = ConditionValue(value: true) {
            false
        }
        XCTAssertFalse(value.condition())
        let falseValue = ConditionValue(value: false) {
            false
        }
        XCTAssertFalse(falseValue.condition())
    }
}

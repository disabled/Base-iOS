//
// Copyright © 2020 Rosberry. All rights reserved.
//

import XCTest
import Base

final class ConditionVariableTests: XCTestCase {

    func testWithOneValue() {
        let variable = ConditionVariable(values: [
            ConditionValue(value: true) {
                true
            }
        ])
        XCTAssertTrue(variable.value)
    }

    func testWithTwoValues() {
        let variable = ConditionVariable {
            ConditionValue(value: true) {
                true
            }
            ConditionValue(value: false) {
                false
            }
        }
        XCTAssertTrue(variable.value)
    }

    func testWithThreeValuesAndOneTrue() {
        let variable = ConditionVariable {
            ConditionValue(value: true) {
                false
            }
            ConditionValue(value: true) {
                false
            }
            ConditionValue(value: false) {
                true
            }
        }
        XCTAssertFalse(variable.value)
    }

    func testWithThreeValuesAndTwoTrues() {
        let firstTrue = ConditionVariable {
            ConditionValue<Bool?>(value: false) {
                true
            }
            ConditionValue<Bool?>(value: nil) {
                false
            }
            ConditionValue<Bool?>(value: true) {
                true
            }
        }
        XCTAssertTrue(firstTrue.value == false)
    }

}

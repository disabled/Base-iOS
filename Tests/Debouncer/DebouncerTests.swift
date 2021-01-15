//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import Base
import XCTest

class DebouncerTests: XCTestCase {

    func testImmediateExecution() {
        var value = 0
        let debouncer = Debouncer(delay: 1.0)

        debouncer.async {
            value = 1
        }
        XCTAssert(value == 1)
    }

    func testExecutionDelay() throws {
        var value = 0
        let debouncer = Debouncer(delay: 1.0)
        let asyncExpectation = expectation(description: "async")

        debouncer.async {
            value = 1
        }

        debouncer.async {
            value = 2
            asyncExpectation.fulfill()
        }

        XCTAssert(value == 1)
        waitForExpectations(timeout: 5.0) { _ in
            XCTAssert(value == 2)
        }
    }

    func testExecutionReject() throws {
        var value = 0
        let debouncer = Debouncer(delay: 1.0)
        let asyncExpectation = expectation(description: "async")

        debouncer.async {
            value = 1
        }
        debouncer.async {
            value = 2
            XCTFail()
        }
        debouncer.async {
            value = 3
            asyncExpectation.fulfill()
        }

        waitForExpectations(timeout: 5.0) { _ in
            XCTAssert(value == 3)
        }
    }

    func testIntermediateExecutionsReject() throws {
        var value = 0
        let debouncer = Debouncer(delay: 1.0)
        debouncer.shouldCancelIntermediateExecutions = true

        let asyncExpectation = expectation(description: "async")
        asyncExpectation.expectedFulfillmentCount = 2

        debouncer.async {
            value = 1
            XCTFail()
        }
        debouncer.async {
            value = 2
            XCTFail()
        }
        debouncer.async {
            value = 3
            asyncExpectation.fulfill()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            debouncer.async {
                value = 4
                asyncExpectation.fulfill()
            }
        }

        waitForExpectations(timeout: 10.0) { _ in
            XCTAssert(value == 4)
        }
    }
}

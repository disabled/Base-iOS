//
// Copyright (c) 2020 Rosberry. All rights reserved.
//

import XCTest
import Base

final class ViewUpdateTests: XCTestCase, ViewUpdate {
    var needsUpdate: Bool = false

    func testUpdate() {
        let viewModel = TestData(first: 1)
        let oldViewModel = TestData(first: 0)

        var isEnteredUpdateClosure = false
        update(new: viewModel, old: oldViewModel, keyPath: \.first) { _ in
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure)

        update(new: TestData(), old: TestData(), keyPath: \.first) { _ in
            XCTFail("shouldn't be called since models are equal")
        }
    }

    func testUpdateWithNeedsUpdate() {
        let viewModel = TestData()
        let oldViewModel = TestData()

        needsUpdate = true
        var isEnteredUpdateClosure = false
        update(new: viewModel, old: oldViewModel, keyPath: \.first) { _ in
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure)
    }
}

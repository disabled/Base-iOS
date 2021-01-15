//
//  Copyright © 2018 Rosberry. All rights reserved.
//

import XCTest
import Base

class ComparableTests: XCTestCase {

    func testClamping() {
        XCTAssertEqual(6.clamped(min: 2, max: 5), 5)
        XCTAssertEqual(1.clamped(min: 2, max: 5), 2)
        XCTAssertEqual(4.clamped(min: 2, max: 5), 4)
    }

    func testClampingRange() {
        XCTAssertEqual(6.clamped(in: 2...5), 5)
        XCTAssertEqual(1.clamped(in: 2...5), 2)
        XCTAssertEqual(4.clamped(in: 2...5), 4)
    }

    func testWrappingToValue() {
        XCTAssertEqual(4.wrapped(from: 0, to: 4), 0)
        XCTAssertEqual(4.wrapped(in: 0..<4), 0)

        XCTAssertEqual(6.wrapped(from: 0, to: 4), 2)
        XCTAssertEqual(3.wrapped(from: 0, to: 4), 3)
        XCTAssertEqual((-1).wrapped(from: 0, to: 4), 3)
    }

    func testWrappingThroughValue() {
        XCTAssertEqual(4.wrapped(from: 0, through: 4), 4)
        XCTAssertEqual(4.wrapped(in: 0...4), 4)

        XCTAssertEqual(6.wrapped(from: 0, through: 4), 2)
        XCTAssertEqual(3.wrapped(from: 0, through: 4), 3)
        XCTAssertEqual((-1).wrapped(from: 0, through: 4), 3)
    }

    func testWrappingCollectionIndex() {
        let collection = [Int](repeating: 0, count: 4)
        XCTAssertEqual(6.wrappedIndex(in: collection), 2)
    }
}

//
//  Copyright © 2018 Rosberry. All rights reserved.
//

import XCTest
import Base

class FloatingPointTests: XCTestCase {

    func testNormalization() {
        let value: Float = 10
        XCTAssertEqual(value.normalized(from: 10, through: 20), 0.0)
        XCTAssertEqual(value.normalized(from: 0, through: 20), 0.5)
        XCTAssertEqual(value.normalized(from: 0, through: 10), 1.0)
        XCTAssertEqual(value.normalized(in: 0...20), 0.5)
    }

    func testDenormalization() {
        XCTAssertEqual(0.0.denormalized(from: 10, through: 20), 10)
        XCTAssertEqual(0.5.denormalized(from: 10, through: 20), 15)
        XCTAssertEqual(1.0.denormalized(from: 10, through: 20), 20)
        XCTAssertEqual(0.5.denormalized(in: 0...20), 10)
    }

}

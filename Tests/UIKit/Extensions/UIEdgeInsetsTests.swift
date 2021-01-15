//
//  Copyright © 2018 Rosberry. All rights reserved.
//

import XCTest
import Base

final class UIEdgeInsetsTests: XCTestCase {

    func testInit() {
        //Given

        //When
        let insets = UIEdgeInsets(inset: 8)
        //Then
        XCTAssertEqual(insets.top, 8)
        XCTAssertEqual(insets.left, 8)
        XCTAssertEqual(insets.bottom, 8)
        XCTAssertEqual(insets.right, 8)
    }

    func testIntegerInit() {
        //Given

        //When
        let insets: UIEdgeInsets = 8
        //Then
        XCTAssertEqual(insets.top, 8)
        XCTAssertEqual(insets.left, 8)
        XCTAssertEqual(insets.bottom, 8)
        XCTAssertEqual(insets.right, 8)
    }

    func testDoubleInit() {
        //Given

        //When
        let insets: UIEdgeInsets = 8.0
        //Then
        XCTAssertEqual(insets.top, 8)
        XCTAssertEqual(insets.left, 8)
        XCTAssertEqual(insets.bottom, 8)
        XCTAssertEqual(insets.right, 8)
    }
}

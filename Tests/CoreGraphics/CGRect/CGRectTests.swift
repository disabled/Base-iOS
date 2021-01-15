//
//  Copyright © 2018 Rosberry. All rights reserved.
//

import XCTest

class CGRectTests: XCTestCase {

    func testAspect() {
        let rect = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 100.0)
        XCTAssertEqual(rect.aspect, 0.5)
    }

    func testFitting() {
        let target = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        let rect = CGRect(fitting: target, aspect: 0.5)
        XCTAssertEqual(rect, CGRect(x: 25.0, y: 0.0, width: 50.0, height: 100.0))
        XCTAssertEqual(rect.fitting(rect: target), rect)
    }

    func testFilling() {
        let target = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        let rect = CGRect(filling: target, aspect: 0.5)
        XCTAssertEqual(rect, CGRect(x: 0.0, y: -50.0, width: 100.0, height: 200.0))
        XCTAssertEqual(rect.filling(rect: target), rect)
    }

}

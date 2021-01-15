//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
import Base

final class SubviewsTests: XCTestCase {

    private lazy var view = UIView()
    private lazy var subview1 = UIView()
    private lazy var subview2 = UIView()
    private lazy var subviews: [UIView] = [subview1, subview2]

    override func setUp() {
        super.setUp()
        for view in view.subviews {
            view.removeFromSuperview()
        }
        subview1.removeFromSuperview()
        subview2.removeFromSuperview()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Tests

    func testAddArray() {
        //Given

        //When
        view.add(subviews)
        //Then
        XCTAssertEqual(view.subviews, subviews)
    }

    func testAddVariadic() {
        //Given

        //When
        view.add(subview1, subview2)
        //Then
        XCTAssertEqual(view.subviews, subviews)
    }

    func testInsertAtIndex() {
        //Given

        //When
        view.add(subview1)
        view.insert(subview2, atIndex: 0)
        //Then
        XCTAssertEqual(view.subviews.first, subview2)
    }

    func testInsertBelow() {
        //Given

        //When
        view.add(subview1)
        view.insert(subview2, below: subview1)
        //Then
        XCTAssertEqual(view.subviews.first, subview2)
    }

    func testInsertAbove() {
        //Given

        //When
        view.add(subview1)
        view.insert(subview2, above: subview1)
        //Then
        XCTAssertEqual(view.subviews.last, subview2)
    }

    func testRemoveView() {
        //Given
        view.addSubview(subview1)
        //When
        view.remove(subview1)
        //Then
        XCTAssertTrue(view.subviews.isEmpty)
    }

    func testRemoveAnotherView() {
        //Given
        view.addSubview(subview1)
        //When
        view.remove(subview2)
        //Then
        XCTAssertEqual(view.subviews, [subview1])
    }

    func testRemoveArray() {
        //Given
        view.addSubview(subview1)
        view.addSubview(subview2)
        //When
        view.remove(subviews)
        //Then
        XCTAssertTrue(view.subviews.isEmpty)
    }

    func testRemoveVariadic() {
        //Given
        view.addSubview(subview1)
        view.addSubview(subview2)
        //When
        view.remove(subview1, subview2)
        //Then
        XCTAssertTrue(view.subviews.isEmpty)
    }

    func testRemoveCollection() {
        //Given
        view.addSubview(subview1)
        view.addSubview(subview2)
        //When
        subviews.removeFromSuperview()
        //Then
        XCTAssertTrue(view.subviews.isEmpty)
        XCTAssertNil(subview1.superview)
        XCTAssertNil(subview2.superview)
    }
}

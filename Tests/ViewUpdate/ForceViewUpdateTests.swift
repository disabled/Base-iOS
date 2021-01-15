//
// Copyright (c) 2020 Rosberry. All rights reserved.
//

import XCTest
import Base

final class ForceViewUpdateTests: XCTestCase, ForceViewUpdate {

    func testAnyEquatable() {
        XCTAssertEqual(AnyEquatable(1), AnyEquatable(1))
        XCTAssertNotEqual(AnyEquatable(1), AnyEquatable(2))
    }

    func testUpdate() {
        let viewModel = TestData(first: 1)
        let oldViewModel = TestData(first: 0)

        var isEnteredUpdateClosure = false
        update(new: viewModel, old: oldViewModel, keyPath: \.first, force: false) { _ in
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure)

        update(new: TestData(), old: TestData(), keyPath: \.first, force: false) { _ in
            XCTFail("shouldn't be called since models are equal")
        }
    }

    func testForceViewUpdate() {
        let viewModel = TestData()
        let oldViewModel = viewModel

        var isEnteredUpdateClosure = false
        update(new: viewModel, old: oldViewModel, keyPath: \.first, force: true) { _ in
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure)
    }

    func testUpdater() {
        let viewModel = TestData(first: 1)
        let oldViewModel = TestData(first: 0)

        let viewUpdate = Update(newModel: viewModel, oldModel: oldViewModel, force: true)

        var isEnteredUpdateClosure = false
        viewUpdate(\.first) { _ in
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure)
    }

    func testViewUpdaterWithDifferentKeyPaths() {
        let viewModel = TestData(first: 1, second: 2, third: 3)
        let oldViewModel = TestData(first: 0, second: 1, third: 2)

        let viewUpdate = Update(newModel: viewModel, oldModel: oldViewModel, force: false)

        var triggersCount = 0
        viewUpdate(\.first, \.second, \.third) {
            triggersCount += 1
        }
        XCTAssertEqual(triggersCount, 1)
    }

    func testUpdateWithEqualViewModels() {
        let viewModel = TestData()
        let oldViewModel = viewModel

        checkAllFields(new: viewModel, old: oldViewModel, force: false) {
            XCTFail("shouldn't enter this closure since view models are equal")
        }
        checkAllFields(new: viewModel, old: oldViewModel, force: false) { isDifferent in
            XCTAssertFalse(isDifferent)
        }

        var isEnteredUpdateClosure = false
        checkAllFields(new: viewModel, old: oldViewModel, force: true) {
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure, "for force update closure should be called")
        checkAllFields(new: viewModel, old: oldViewModel, force: true) { isDifferent in
            XCTAssertTrue(isDifferent)
        }
    }

    func testUpdateWithSingleFieldDifferenceInViewModels() {
        let viewModel = TestData(first: 0)
        let oldViewModel = TestData(first: 1)

        var isEnteredUpdateClosure = false
        checkAllFields(new: viewModel, old: oldViewModel, force: false) {
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure, "update should be called since view models are not equal")
        checkAllFields(new: viewModel, old: oldViewModel, force: false) { isDifferent in
            XCTAssertTrue(isDifferent)
        }
    }

    func testUpdateWithMultipleFieldDifferenceInViewModels() {
        let viewModel = TestData(first: 1, second: 2, third: 0, forth: 4)
        let oldViewModel = TestData(first: 1, second: 0, third: 0, forth: -4)

        var isEnteredUpdateClosure = false
        checkAllFields(new: viewModel, old: oldViewModel, force: false) {
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure, "update should be called since view models are not equal")
        checkAllFields(new: viewModel, old: oldViewModel, force: false) { isDifferent in
            XCTAssertTrue(isDifferent)
        }
    }

    func testTwoKeypathsUpdate() {
        let keypaths = (\TestData.first, \TestData.second)
        var isEnteredUpdateClosure = false
        update(new: TestData.positive, old: TestData.negative, keyPaths: keypaths, force: false) {
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure)

        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: false) {
            XCTFail("shouldn't be called since models are equal")
        }
        var isEnteredForceUpdateClosure = false
        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: true) {
            isEnteredForceUpdateClosure = true
        }
        XCTAssertTrue(isEnteredForceUpdateClosure)
    }

    func testThreeKeypathsUpdate() {
        let keypaths = (\TestData.first, \TestData.second, \TestData.third)
        var isEnteredUpdateClosure = false
        update(new: TestData.positive, old: TestData.negative, keyPaths: keypaths, force: false) {
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure)

        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: false) {
            XCTFail("shouldn't be called since models are equal")
        }
        var isEnteredForceUpdateClosure = false
        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: true) {
            isEnteredForceUpdateClosure = true
        }
        XCTAssertTrue(isEnteredForceUpdateClosure)
    }

    func testFourKeypathsUpdate() {
        let keypaths = (\TestData.first, \TestData.second, \TestData.third, \TestData.forth)
        var isEnteredUpdateClosure = false
        update(new: TestData.positive, old: TestData.negative, keyPaths: keypaths, force: false) {
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure)

        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: false) {
            XCTFail("shouldn't be called since models are equal")
        }
        var isEnteredForceUpdateClosure = false
        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: true) {
            isEnteredForceUpdateClosure = true
        }
        XCTAssertTrue(isEnteredForceUpdateClosure)
    }

    func testFiveKeypathsUpdate() {
        let keypaths = (\TestData.first, \TestData.second, \TestData.third, \TestData.forth, \TestData.fifth)
        var isEnteredUpdateClosure = false
        update(new: TestData.positive, old: TestData.negative, keyPaths: keypaths, force: false) {
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure)

        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: false) {
            XCTFail("shouldn't be called since models are equal")
        }
        var isEnteredForceUpdateClosure = false
        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: true) {
            isEnteredForceUpdateClosure = true
        }
        XCTAssertTrue(isEnteredForceUpdateClosure)
    }

    func testSixKeypathsUpdate() {
        let keypaths = (\TestData.first, \TestData.second, \TestData.third, \TestData.forth, \TestData.fifth, \TestData.sixth)
        var isEnteredUpdateClosure = false
        update(new: TestData.positive, old: TestData.negative, keyPaths: keypaths, force: false) {
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure)

        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: false) {
            XCTFail("shouldn't be called since models are equal")
        }
        var isEnteredForceUpdateClosure = false
        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: true) {
            isEnteredForceUpdateClosure = true
        }
        XCTAssertTrue(isEnteredForceUpdateClosure)
    }

    func testSevenKeypathsUpdate() {
        let keypaths = (\TestData.first,
                        \TestData.second,
                        \TestData.third,
                        \TestData.forth,
                        \TestData.fifth,
                        \TestData.sixth,
                        \TestData.seventh)
        var isEnteredUpdateClosure = false
        update(new: TestData.positive, old: TestData.negative, keyPaths: keypaths, force: false) {
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure)

        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: false) {
            XCTFail("shouldn't be called since models are equal")
        }
        var isEnteredForceUpdateClosure = false
        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: true) {
            isEnteredForceUpdateClosure = true
        }
        XCTAssertTrue(isEnteredForceUpdateClosure)
    }

    func testEightKeypathsUpdate() {
        let keypaths = (\TestData.first,
                        \TestData.second,
                        \TestData.third,
                        \TestData.forth,
                        \TestData.fifth,
                        \TestData.sixth,
                        \TestData.seventh,
                        \TestData.eightth)
        var isEnteredUpdateClosure = false
        update(new: TestData.positive, old: TestData.negative, keyPaths: keypaths, force: false) {
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure)

        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: false) {
            XCTFail("shouldn't be called since models are equal")
        }
        var isEnteredForceUpdateClosure = false
        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: true) {
            isEnteredForceUpdateClosure = true
        }
        XCTAssertTrue(isEnteredForceUpdateClosure)
    }

    func testNineKeypathsUpdate() {
        let keypaths = (\TestData.first,
                        \TestData.second,
                        \TestData.third,
                        \TestData.forth,
                        \TestData.fifth,
                        \TestData.sixth,
                        \TestData.seventh,
                        \TestData.eightth,
                        \TestData.nineth)
        var isEnteredUpdateClosure = false
        update(new: TestData.positive, old: TestData.negative, keyPaths: keypaths, force: false) {
            isEnteredUpdateClosure = true
        }
        XCTAssertTrue(isEnteredUpdateClosure)

        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: false) {
            XCTFail("shouldn't be called since models are equal")
        }
        var isEnteredForceUpdateClosure = false
        update(new: TestData(), old: TestData(), keyPaths: keypaths, force: true) {
            isEnteredForceUpdateClosure = true
        }
        XCTAssertTrue(isEnteredForceUpdateClosure)
    }

    private func checkAllFields(new: TestData, old: TestData, force: Bool, configurationHandler: () -> Void) {
        update(new: new, old: old, values: [
            makeAnyEquatables(new: new, old: old, keyPath: \.first),
            makeAnyEquatables(new: new, old: old, keyPath: \.second),
            makeAnyEquatables(new: new, old: old, keyPath: \.third),
            makeAnyEquatables(new: new, old: old, keyPath: \.forth),
            makeAnyEquatables(new: new, old: old, keyPath: \.fifth)
        ], force: force) {
            configurationHandler()
        }
    }

    private func checkAllFields(new: TestData, old: TestData, force: Bool, configurationHandler: (Bool) -> Void) {
        update(new: new, old: old, values: [
            makeAnyEquatables(new: new, old: old, keyPath: \.first),
            makeAnyEquatables(new: new, old: old, keyPath: \.second),
            makeAnyEquatables(new: new, old: old, keyPath: \.third),
            makeAnyEquatables(new: new, old: old, keyPath: \.forth),
            makeAnyEquatables(new: new, old: old, keyPath: \.fifth)
        ], force: force, configurationHandler: configurationHandler)
    }

}

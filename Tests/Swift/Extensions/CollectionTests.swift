//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
import Base

final class CollectionTests: XCTestCase {

    var cats: [Cat] = []

    override func setUp() {
        super.setUp()

        cats = [.garfield,
                .tom,
                .gav,
                .sylvester,
                .leopold,
                .matroskin,
                .vSapogah,
                .bazilio]
    }

    func testMapKeyPath() {
        // Given

        // When
        let names = cats.map(by: \.name)
        // Then
        XCTAssertEqual(names,
                       ["Garfield", "Tom", "Gav", "Sylvester", "Leopold", "Matroskin", "VSаpogah", "Bazilio"],
                       "Data should be equal")
    }

    func testFilterKeyPath() {
        // Given
        let barsik = Cat(age: 1, name: "Barsik")
        // When
        /// Returns collection of elements that are having value at certain keypath equal to value at keypath of passed element.
        let youngCats = cats.filter(by: \.age, of: barsik)
        // Then
        XCTAssertEqual(youngCats, [.garfield, .gav, .sylvester], "Cats with age == 1")
    }

    func testFilterKeyPathValue() {
        // Given

        // When
        let triennial = cats.filter(by: 3, at: \.age)
        // Then
        XCTAssertEqual(triennial, [.tom, .vSapogah], "Cats with age == 3")
    }

    func testFilterKeyPathPredicate() {
        // Given

        // When
        let fourYearCats = cats.filter(by: \.age) { age -> Bool in
            return age == 4
        }
        // Then
        XCTAssertEqual(fourYearCats, [.matroskin, .bazilio], "Cats with age == 4")
    }

    func testFirstKeyPath() {
        // Given
        let barsik = Cat(age: 3, name: "Barsik")
        // When
        let cat = cats.first(by: \.age, of: barsik)
        // Then
        XCTAssertEqual(cat, .tom, "Data should be equal because first cat with age == 3 is Tom")
    }

    func testFirstKeyPathValue() {
        // Given

        // When
        let cat = cats.first(with: 4, at: \.age)
        // Then
        XCTAssertEqual(cat, .matroskin, "Data should be equal because first item with age == 4 is Matroskin")
    }

    func testContainsKeyPath() {
        // Given
        let barsik = Cat(age: 1, name: "Barsik")
        // When
        let isInclude = cats.contains(by: \.age, of: barsik)
        let isNotInclude = cats.contains(by: \.name, of: barsik)
        // Then
        XCTAssertTrue(isInclude, "isInclude should be true because cat with age == 1 include in cats")
        XCTAssertFalse(isNotInclude, "isNotInclude should be false because cat with name == \"Barsik\" don't include in cats")
    }

    func testContainsKeyPathValue() {
        // Given

        // When
        let isInclude = cats.contains(with: "Gav", at: \.name)
        let isNotInclude = cats.contains(with: "Pepsi", at: \.name)
        // Then
        XCTAssertTrue(isInclude, "isInclude should be true because cat with name == \"Gav\" include in cats")
        XCTAssertFalse(isNotInclude, "isNotInclude should be false because cat with name == \"Pepsi\" don't include in cats")
    }

    func testIndexKeyPath() {
        // Given
        let barsik = Cat(age: 5, name: "Barsik")
        // When
        let index = cats.index(by: \.age, of: barsik)
        // Then
        XCTAssertEqual(index, 4, "Index should be equal 4 because index of the first cat with age == 5 is 4")
    }

    func testIndexKeyPathValue() {
        // Given

        // When
        let index = cats.index(with: "Sylvester", at: \.name)
        // Then
        XCTAssertEqual(index, 3, "Index should be equal 3 because index of the first cat with name == \"Sylvester\" is 3")
    }

    func testMinKeyPath() {
        // Given

        // When
        let youngCat = cats.min(by: \.age)
        // Then
        XCTAssertEqual(youngCat, .garfield, "First cat with min age is Garfield")
    }

    func testMaxKeyPath() {
        // Given

        // When
        let oldCat = cats.max(by: \.age)
        // Then
        XCTAssertEqual(oldCat, .leopold, "First cat with max age is Leopold")
    }

    func testMapMinKeyPath() {
        // Given

        // When
        let minAge = cats.mapMin(by: \.age)
        // Then
        XCTAssertEqual(minAge, 1, "Min age of cats is 1")
    }

    func testMapMaxKeyPath() {
        // Given

        // When
        let maxAge = cats.mapMax(by: \.age)
        // Then
        XCTAssertEqual(maxAge, 5, "Max age of cats is 5")
    }

    func testLoop() {
        // Given
        let data = [1, 2, 3, 4, 5, 6, 7]
        var newData: [Int] = []
        // When
        data.forEach { item, stop in
            newData.append(item)
            if item == 4 {
                stop = true
            }
        }
        // Then
        XCTAssertEqual(newData, [1, 2, 3, 4], "Data should be equal because items are no longer added after item == 4")
    }

    func testFilterByType() {
        // Given
        let data: [Any] = ["abc", 5, "string", 1.2, ["", ""]]
        // When
        let newData = data.filter(byType: String.self)
        // Then
        XCTAssertEqual(newData, ["abc", "string"], "Data should be equal because newData filter by string type")
    }

    func testCompactMap() {
        let data = cats + [nil]
        XCTAssertTrue(data is [Cat?], "Data element should be optional since it contains nil")
        XCTAssertTrue(data.compactMap(by: \.self) is [Cat], "Data element should not be optional since all nils are filtered")
    }

    func testIsAll() {
        XCTAssertFalse([true, false, true].isAll(with: true, at: \.self), "Should be false since data contain false")
        XCTAssertTrue([true, true, true].isAll(with: true, at: \.self), "Should be true since all value are true")
    }

    func testSorted() {
        let sortedData = Array(0...10)
        let unsortedData = sortedData.shuffled()
        XCTAssertEqual(sortedData, unsortedData.sorted(by: \.self),
                       "Arrays should be equal since unsorted were sorted")
    }

    func testOptionalSorted() {
        let sortedData = Array(0...10) + [nil, nil]
        let unsortedData = sortedData.shuffled()
        XCTAssertEqual(sortedData, unsortedData.sorted(by: \.self, defaultValue: .max),
                       "Arrays should be equal since unsorted were sorted")
    }

    func testSortedDescending() {
        let sortedData = Array((0...10).reversed())
        let unsortedData = sortedData.shuffled()
        XCTAssertEqual(sortedData, unsortedData.sorted(by: \.self, using: >),
                       "Arrays should be equal since unsorted were sorted")
    }

    func testOptionalSortedDescending() {
        let sortedData = [nil, nil] + Array((0...10).reversed())
        let unsortedData = sortedData.shuffled()
        XCTAssertEqual(sortedData, unsortedData.sorted(by: \.self, defaultValue: .max, using: >),
                       "Arrays should be equal since unsorted were sorted")
    }

    func testMutableSort() {
        let sortedData = Array(0...10)
        var unsortedData = sortedData.shuffled()
        unsortedData.sort(by: \.self)
        XCTAssertEqual(sortedData, unsortedData,
                       "Arrays should be equal since unsorted were sorted")
    }

    func testMutableOptionalSort() {
        let sortedData = Array(0...10) + [nil, nil]
        var unsortedData = sortedData.shuffled()
        unsortedData.sort(by: \.self, defaultValue: .max)
        XCTAssertEqual(sortedData, unsortedData,
                       "Arrays should be equal since unsorted were sorted")
    }

    func testMutableSortDescending() {
        let sortedData = Array((0...10).reversed())
        var unsortedData = sortedData.shuffled()
        unsortedData.sort(by: \.self, using: >)
        XCTAssertEqual(sortedData, unsortedData,
                       "Arrays should be equal since unsorted were sorted")
    }

    func testMutableOptionalSortDescending() {
        let sortedData = [nil, nil] + Array((0...10).reversed())
        var unsortedData = sortedData.shuffled()
        unsortedData.sort(by: \.self, defaultValue: .max, using: >)
        XCTAssertEqual(sortedData, unsortedData,
                       "Arrays should be equal since unsorted were sorted")
    }

    func testOptionalCollection() {
        // Given
        var data: [Int]?
        // When
        let isNilOrEmpty = data.isNilOrEmpty

        data = []
        let isEmpty = data.isNilOrEmpty

        data?.append(1)
        let isEmptyAfterAppend = data.isNilOrEmpty
        // Then
        XCTAssertTrue(isNilOrEmpty, "isNilOrEmpty should be true before adding")
        XCTAssertTrue(isEmpty, "isEmpty should be true before adding")
        XCTAssertFalse(isEmptyAfterAppend, "isEmptyAfterAppend should not be true before adding")
    }
}

//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
import Base

final class Cat: Equatable {

    let age: Int
    let name: String

    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }

    static func == (lhs: Cat, rhs: Cat) -> Bool {
        return lhs.age == rhs.age &&
               lhs.name == rhs.name
    }
}

extension Cat {
    static let garfield = Cat(age: 1, name: "Garfield")
    static let tom = Cat(age: 3, name: "Tom")
    static let gav = Cat(age: 1, name: "Gav")
    static let sylvester = Cat(age: 1, name: "Sylvester")
    static let leopold = Cat(age: 5, name: "Leopold")
    static let matroskin = Cat(age: 4, name: "Matroskin")
    static let vSapogah = Cat(age: 3, name: "VSаpogah")
    static let bazilio = Cat(age: 4, name: "Bazilio")
}

final class ArrayTests: XCTestCase {

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

    func testRemoveFirstKeyPath() {
        // Given
        let tom = Cat(age: 3, name: "Tom")
        let catsWithoutTom: [Cat] = [.garfield,
                                     .gav,
                                     .sylvester,
                                     .leopold,
                                     .matroskin,
                                     .vSapogah,
                                     .bazilio]
        // When
        // Removes element that has value at certain keypath equal to value at keypath of passed element.
        cats.removeFirst(by: \.name, of: tom)
        // Then
        // Cat removed from cats array with value at keypass .name == "Tom"
        // And catsWithoutTomCat array does not include cat with value at keypass .name == "Tom".
        XCTAssertEqual(cats, catsWithoutTom, "Data should be equal")
    }

    func testRemoveFirstKeyPathValue() {
        // Given
        let catsWithoutLeopold: [Cat] = [.garfield,
                                         .tom,
                                         .gav,
                                         .sylvester,
                                         .matroskin,
                                         .vSapogah,
                                         .bazilio]
        // When
        // Removes element that has specific value at certain keypath.
        cats.removeFirst(with: 5, at: \.age)
        // Then
        // Cat removed from cats array with value at keypass .age == 5
        // And catsWithoutLeopold array does not include cat with value at keypass .age == 5.
        XCTAssertEqual(cats, catsWithoutLeopold, "Data should be equal")
    }

    func testUnique() {
        // Given
        let items = [1, 2, 3, 2, 4, 2, 1, 2, 1, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1]
        // When
        let uniqueItems = items.unique
        // Then
        XCTAssertEqual(uniqueItems, [1, 2, 3, 4], "Data should be equal because duplicate elements removed")
    }

    func testRemoveFirstElement() {
        // Given
        let catsWithoutGav: [Cat] = [.garfield,
                                     .tom,
                                     .sylvester,
                                     .leopold,
                                     .matroskin,
                                     .vSapogah,
                                     .bazilio]
        // When
        cats.removeFirst(.gav)
        // Then
        XCTAssertEqual(cats, catsWithoutGav, "Data should be equal because gav cat removed")
    }

    func testSubscriptIndex() {
        // Given

        // When
        let firstCat = cats[safe: 0]
        let nonexistentCat = cats[safe: 10]
        // Then
        XCTAssertEqual(firstCat, .garfield, "Data should be equal")
        XCTAssertNil(nonexistentCat, "There are only 8 cats in the cats array so item at index 10 should be nil")
    }
}

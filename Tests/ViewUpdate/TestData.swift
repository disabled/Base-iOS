//
// Copyright (c) 2020 Rosberry. All rights reserved.
//

import Foundation

struct TestData {
    let first: Int
    let second: Int
    let third: Int
    let forth: Int
    let fifth: Int
    let sixth: Int
    let seventh: Int
    let eightth: Int
    let nineth: Int

    init(first: Int = 0,
         second: Int = 0,
         third: Int = 0,
         forth: Int = 0,
         fifth: Int = 0,
         sixth: Int = 0,
         seventh: Int = 0,
         eightth: Int = 0,
         nineth: Int = 0) {

        self.first = first
        self.second = second
        self.third = third
        self.forth = forth
        self.fifth = fifth
        self.sixth = sixth
        self.seventh = seventh
        self.eightth = eightth
        self.nineth = nineth
    }

    static var positive: TestData {
        .init(first: 1, second: 2, third: 3, forth: 4, fifth: 5, sixth: 6, seventh: 7, eightth: 8, nineth: 9)
    }

    static var negative: TestData {
        .init(first: -1, second: -2, third: -3, forth: -4, fifth: -5, sixth: -6, seventh: -7, eightth: -8, nineth: -9)
    }
}

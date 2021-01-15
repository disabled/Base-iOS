//
//  Copyright © 2018 Rosberry. All rights reserved.
//

public extension FloatingPoint {

    func denormalized(from: Self, through: Self) -> Self {
        return from + (through - from) * self
    }

    func denormalized(in range: ClosedRange<Self>) -> Self {
        return denormalized(from: range.lowerBound, through: range.upperBound)
    }

    func normalized(from: Self, through: Self) -> Self {
        return (self - from) / (through - from)
    }

    func normalized(in range: ClosedRange<Self>) -> Self {
        return normalized(from: range.lowerBound, through: range.upperBound)
    }
}

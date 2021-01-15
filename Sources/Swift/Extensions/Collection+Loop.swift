//
//  Copyright © 2018 Rosberry. All rights reserved.
//

public extension Collection {

    /// Classic forEach with ability to stop looping by assigning Bool value to specific pointer.
    func forEach(body: (Element, inout Bool) -> Void) {
        var stop = false
        for value in self {
            if stop {
                break
            }
            body(value, &stop)
        }
    }
}

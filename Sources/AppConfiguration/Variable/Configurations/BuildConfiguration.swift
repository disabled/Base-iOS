//
// Copyright (c) 2018 Rosberry. All rights reserved.
//

import Foundation

/// This enum is used for defining which build configuration is in use now
/// Don't create cases directly, use init method instead
public enum BuildConfiguration {
    case debug
    case adhoc
    case appStore

    public static var current: Self {
        get {
            guard let underlyingCurrent = underlyingCurrent else {
                fatalError("BuildConfiguration.current is not set")
            }
            return underlyingCurrent
        }
        set {
            underlyingCurrent = newValue
        }
    }
    
    private static var underlyingCurrent: Self!

    public init() {
        self = .current
    }
}

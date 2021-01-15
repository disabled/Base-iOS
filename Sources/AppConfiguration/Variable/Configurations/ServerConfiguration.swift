//
// Copyright (c) 2018 Rosberry. All rights reserved.
//

import Foundation

/// This enum is used for defining which server configuration is in use now.
/// It depends on build configuration in general but it also possible to
/// switch configuration by setting `server` variable in `UserDefaults`
/// see `ServerName` enum for possible server names.
/// Don't create cases directly, use init method instead
public enum ServerConfiguration {
    case development
    case staging
    case production

    public static var `default`: ServerConfiguration {
        get {
            guard let underlyingDefault = underlyingDefault else {
                fatalError("ServerConfiguration.underlyingDefault is not set")
            }
            return underlyingDefault
        }
        set {
            underlyingDefault = newValue
        }
    }
    private static var underlyingDefault: ServerConfiguration!

    public init() {
        switch BuildConfiguration.current {
        case .appStore:
            self = .production
        default:
            switch UserDefaults.standard.serverName {
            case .production:
                self = .production
            case .staging:
                self = .staging
            case .development:
                self = .development
            default:
                self = .default
            }
        }
    }
}

/// Constants for server names
public enum ServerName: String, CaseIterable {
    case production
    case staging
    case development
}

public extension UserDefaults {
    /// Use this variable to define which server name must be used
    /// see `ServerName` enum for possible server names.
    var serverName: ServerName? {
        get {
            ServerName(rawValue: string(forKey: #function) ?? "")
        }
        set {
            set(newValue?.rawValue, forKey: #function)
        }
    }
}

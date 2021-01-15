//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import Foundation

public extension URL {

    enum Scheme: String {
        case https
        case itms = "itms-apps"
    }

    /// Returns an url for App Store app.
    ///
    /// Example: [itms-apps://itunes.apple.com/app/id1434568484?action=write-review]()
    ///
    /// - Parameters:
    ///   - id: The id of the app.
    ///   - scheme: The scheme of the url.
    ///   - openReviewPage: The flag for review page opening. False by default.
    /// - Returns: an url for App Store app.
    static func appStoreURL(forAppWithID id: String, scheme: Scheme = .https, openReviewPage: Bool = false) -> URL? {
        var components = URLComponents()
        components.scheme = scheme.rawValue
        components.host = "itunes.apple.com"
        components.path = "/app/id" + id
        if openReviewPage {
            components.queryItems = [URLQueryItem(name: "action", value: "write-review")]
        }
        return components.url
    }
}

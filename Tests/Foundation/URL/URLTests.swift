//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest

final class URLTests: XCTestCase {

    private let appID: String = "1434568484"

    func testURLWithoutOpeningReviewPage() {
        let url = URL.appStoreURL(forAppWithID: appID)
        test(url)
        XCTAssertNil(url?.query)
        XCTAssertEqual(url?.scheme, "https", "The URL has wrong scheme")
    }

    func testURLWithOpeningReviewPage() {
        let url = URL.appStoreURL(forAppWithID: appID, openReviewPage: true)
        test(url)
        XCTAssertEqual(url?.query, "action=write-review", "The URL has wrong query")
        XCTAssertEqual(url?.scheme, "https", "The URL has wrong scheme")
    }

    func testURLWithDifferentScheme() {
        let url = URL.appStoreURL(forAppWithID: appID, scheme: .itms)
        test(url)
        XCTAssertEqual(url?.scheme, "itms-apps", "The URL has wrong scheme")
    }

    // MARK: - Private

    private func test(_ url: URL?) {
        XCTAssertNotNil(url, "There is no url")
        XCTAssertEqual(url?.host, "itunes.apple.com", "The URL has wrong host")
        XCTAssertEqual(url?.path, "/app/id" + appID, "The URL has wrong path")
    }
}

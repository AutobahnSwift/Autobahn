@testable import AutobahnDescription
import XCTest

class AutobahnDescriptionTests: XCTestCase {
    func testExample() {
        XCTAssertTrue(true)
    }
}

#if os(Linux)
extension AutobahnDescriptionTests {
    static let allTests = [
        ("testExample", testExample)
    ]
}
#endif

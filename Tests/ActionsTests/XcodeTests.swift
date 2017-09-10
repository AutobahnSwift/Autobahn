@testable import Actions
import XCTest

class XcodeTests: XCTestCase {
    func testExample() {
        XCTAssertTrue(true)
    }
}

#if os(Linux)
extension XcodeTests {
    static let allTests = [
        ("testExample", testExample)
    ]
}
#endif

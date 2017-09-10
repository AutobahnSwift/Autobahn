@testable import Actions
import XCTest

class FastlaneTests: XCTestCase {
    func testExample() {
        XCTAssertTrue(true)
    }
}

#if os(Linux)
extension FastlaneTests {
    static let allTests = [
        ("testExample", testExample)
    ]
}
#endif

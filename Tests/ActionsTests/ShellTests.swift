@testable import Actions
import XCTest

class ShellTests: XCTestCase {
    func testExample() {
        XCTAssertTrue(true)
    }
}

#if os(Linux)
extension ShellTests {
    static let allTests = [
        ("testExample", testExample)
    ]
}
#endif

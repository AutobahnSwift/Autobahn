import XCTest
@testable import AutobahnFramework

class ActionsTests: XCTestCase {
    var console: TestConsole = .default()
    lazy var command = Actions(console: self.console)

    // MARK: Tests

    func testExample() throws {
//        try command.run(arguments: [])
//
//        XCTAssertEqual("Running Hello ...", console.outputBuffer.last ?? "")
    }
}

#if os(Linux)
extension ActionsTests {
    static let allTests = [
        ("testExample", testExample)
    ]
}
#endif

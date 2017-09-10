import XCTest
@testable import AutobahnFramework

class HighwaysTests: XCTestCase {
    var console: TestConsole = .default()
    lazy var command = Highways(console: self.console)

    // MARK: Tests

    func testExample() throws {
//        try command.run(arguments: [])
//
//        XCTAssertEqual("Running Hello ...", console.outputBuffer.last ?? "")
    }
}

#if os(Linux)
extension HighwaysTests {
    static let allTests = [
        ("testExample", testExample)
    ]
}
#endif

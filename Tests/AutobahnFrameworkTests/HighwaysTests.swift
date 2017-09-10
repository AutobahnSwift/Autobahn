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

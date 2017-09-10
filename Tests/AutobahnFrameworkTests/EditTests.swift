import XCTest
@testable import AutobahnFramework

class EditTests: XCTestCase {
    var console: TestConsole = .default()
    lazy var command = Edit(console: self.console)

    // MARK: Tests

    func testExample() throws {
//        try command.run(arguments: [])
//
//        XCTAssertEqual("Running Hello ...", console.outputBuffer.last ?? "")
    }
}

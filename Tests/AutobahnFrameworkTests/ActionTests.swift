import XCTest
@testable import AutobahnFramework

class ActionTests: XCTestCase {
    var console: TestConsole = .default()
    lazy var command = Action(console: self.console)

    // MARK: Tests

    func testExample() throws {
//        try command.run(arguments: [])
//
//        XCTAssertEqual("Running Hello ...", console.outputBuffer.last ?? "")
    }
}

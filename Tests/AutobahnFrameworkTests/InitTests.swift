import XCTest
@testable import AutobahnFramework

class InitTests: XCTestCase {
    var console: TestConsole = .default()
    lazy var command = Init(console: self.console)

    // MARK: Tests

    func testInitNameResolution() throws {
//        try command.run(arguments: ["build"])
//
//        XCTAssertEqual("Running Hello ...", console.outputBuffer.last ?? "")
    }
}

#if os(Linux)
extension InitTests {
    static let allTests = [
        ("testInitNameResolution", testInitNameResolution)
    ]
}
#endif

import XCTest
@testable import AutobahnFramework

class DriveTests: XCTestCase {
    var console: TestConsole = .default()
    lazy var command = Drive(console: self.console)

    // MARK: Tests

    func testDriveNameResolution() throws {
//        try command.run(arguments: ["build"])
//
//        XCTAssertEqual("Running Hello ...", console.outputBuffer.last ?? "")
    }
}

#if os(Linux)
extension DriveTests {
    static let allTests = [
        ("testDriveNameResolution", testDriveNameResolution)
    ]
}
#endif

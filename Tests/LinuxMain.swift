// Generated using Sourcery 0.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest

@testable import AutobahnDescriptionTests
@testable import AutobahnFrameworkTests

extension AutobahnDescriptionTests {
  static var allTests: [(String, (AutobahnDescriptionTests) -> () throws -> Void)] = [
    ("testExample", testExample)
  ]
}

extension AutobahnFrameworkTests {
  static var allTests: [(String, (AutobahnFrameworkTests) -> () throws -> Void)] = [
    ("testExample", testExample)
  ]
}

XCTMain([
  testCase(AutobahnDescriptionTests.allTests),
  testCase(AutobahnFrameworkTests.allTests),
])

// Generated using Sourcery 0.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest

@testable import AutobahnDescriptionTests
@testable import AutobahnFrameworkTests
@testable import ActionsTests

extension ActionTests {
  static var allTests: [(String, (ActionTests) -> () throws -> Void)] = [
    ("testExample", testExample)
  ]
}

extension ActionsTests {
  static var allTests: [(String, (ActionsTests) -> () throws -> Void)] = [
    ("testExample", testExample)
  ]
}

extension AutobahnDescriptionTests {
  static var allTests: [(String, (AutobahnDescriptionTests) -> () throws -> Void)] = [
    ("testExample", testExample)
  ]
}

extension DriveTests {
  static var allTests: [(String, (DriveTests) -> () throws -> Void)] = [
    ("testDriveNameResolution", testDriveNameResolution)
  ]
}

extension EditTests {
  static var allTests: [(String, (EditTests) -> () throws -> Void)] = [
    ("testExample", testExample)
  ]
}

extension FastlaneTests {
  static var allTests: [(String, (FastlaneTests) -> () throws -> Void)] = [
    ("testExample", testExample)
  ]
}

extension HighwaysTests {
  static var allTests: [(String, (HighwaysTests) -> () throws -> Void)] = [
    ("testExample", testExample)
  ]
}

extension InitTests {
  static var allTests: [(String, (InitTests) -> () throws -> Void)] = [
    ("testInitNameResolution", testInitNameResolution)
  ]
}

extension ShellTests {
  static var allTests: [(String, (ShellTests) -> () throws -> Void)] = [
    ("testExample", testExample)
  ]
}

extension XcodeTests {
  static var allTests: [(String, (XcodeTests) -> () throws -> Void)] = [
    ("testExample", testExample)
  ]
}

XCTMain([
  testCase(ActionTests.allTests),
  testCase(ActionsTests.allTests),
  testCase(AutobahnDescriptionTests.allTests),
  testCase(DriveTests.allTests),
  testCase(EditTests.allTests),
  testCase(FastlaneTests.allTests),
  testCase(HighwaysTests.allTests),
  testCase(InitTests.allTests),
  testCase(ShellTests.allTests),
  testCase(XcodeTests.allTests),
])

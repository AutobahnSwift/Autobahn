import XCTest
import Console
import libc
@testable import AutobahnFramework

final class TestConsole: ConsoleProtocol {
    /// Returns a string of input read from the console
    /// until a line feed character was found,
    /// hides entry for security
    func secureInput() -> String {
        return ""
    }

    var inputBuffer: [String]
    var outputBuffer: [String]
    var executeBuffer: [String]
    var backgroundExecuteOutputBuffer: [String: String]
    var newLine: Bool

    // MARK: Protocol conformance
    var confirmOverride: Bool?
    var size: (width: Int, height: Int)

    init() {
        inputBuffer = []
        outputBuffer = []
        executeBuffer = []
        backgroundExecuteOutputBuffer = [:]

        confirmOverride = true
        size = (0, 0)
        newLine = false
    }


    func output(_ string: String, style: ConsoleStyle, newLine: Bool) {
        if self.newLine {
            self.newLine = false
            outputBuffer.append("")
        }

        let last = outputBuffer.last ?? ""
        outputBuffer = Array(outputBuffer.dropLast())
        outputBuffer.append(last + string)

        self.newLine = newLine
    }


    func input() -> String {
        let input = inputBuffer.joined(separator: "\n")
        inputBuffer = []
        return input
    }

    func clear(_ clear: ConsoleClear) {
        switch clear {
        case .line:
            outputBuffer = Array(outputBuffer.dropLast())
        case .screen:
            outputBuffer = []
        }
    }

    func execute(program: String, arguments: [String], input: Int32?, output: Int32?, error: Int32?) throws {
        exec(program, args: arguments)
    }

    func backgroundExecute(program: String, arguments: [String]) throws -> String {
        exec(program, args: arguments)
        let command = program + " " + arguments.joined(separator: " ")
        guard let val = backgroundExecuteOutputBuffer[command] else {
            throw AutobahnError.general("No command set for '\(command)'", help: "")
        }
        return val
    }

    private func exec(_ command: String, args: [String]) {
        executeBuffer.append(command + (!args.isEmpty ? " " + args.joined(separator: " ") : ""))
    }

    static func `default`() -> TestConsole {
        let console = TestConsole()

        // swift commands
//        console.backgroundExecuteOutputBuffer["swift package --enable-prefetching fetch"] = ""
//        console.backgroundExecuteOutputBuffer["swift package fetch"] = ""
//        console.backgroundExecuteOutputBuffer["swift build --enable-prefetching"] = ""
//        console.backgroundExecuteOutputBuffer["swift build"] = ""
//
//        console.backgroundExecuteOutputBuffer["swift package dump-package"] = try! JSON(["name": "Hello"]).serialize().makeString()
//        // find commands
//        console.backgroundExecuteOutputBuffer["find ./Sources -type f -name main.swift"] =
//        "~/Desktop/MyProject/Sources/Hello/main.swift"
//
//        // ls commands
//        console.backgroundExecuteOutputBuffer["ls .build/debug/Hello"] = ".build/debug/Hello\n"
//        console.backgroundExecuteOutputBuffer["ls -a ."] = ""
//        console.backgroundExecuteOutputBuffer["ls .build/debug"] = ""
//        console.backgroundExecuteOutputBuffer["ls .build/release"] = ""
//        console.backgroundExecuteOutputBuffer["ls .build/release/Hello"] = ".build/release/Hello\n"
//
//        // rm commands
//        console.backgroundExecuteOutputBuffer["rm -rf .build"] = ""
//        console.backgroundExecuteOutputBuffer["rm -rf *.xcodeproj"] = ""
//        console.backgroundExecuteOutputBuffer["rm -rf Package.pins"] = ""
        return console
    }
}

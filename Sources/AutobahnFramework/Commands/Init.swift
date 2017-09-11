import Foundation
import Console

public final class Init: Command {
    public let id = "init"
    public let help: [String] = ["Creates a default Autobahn.swift file"]
    public let signature: [Argument] = [
        Option(name: "path", help: ["Location where you would like it to be created"])
    ]
    public let console: ConsoleProtocol

    public init(console: ConsoleProtocol) {
        self.console = console
    }

    public func run(arguments: [String]) throws {
//        let path = try value("path", from: arguments)
        let path = "Autobahn.swift"
        let fm = FileManager.default
        if fm.fileExists(atPath: path) {
            let answer = console.ask("Do you want to override the existing Autobahn.swift file? (y/n): ")
            if answer == "y" {
                let fileData = autobahnSwiftTemplate.data(using: .utf8)
                if !fm.createFile(atPath: path, contents: fileData, attributes: nil) {
                    throw AutobahnError.general("Unable to create Autobahn.swift", help: "¯\\_(ツ)_/¯")
                }
            } else {
                console.warning("Init aborted!")
            }
        }
    }
}

let autobahnSwiftTemplate = """
import Foundation
import AutobahnDescription

beforeAll { highway in
    print("Driving highway: \\(highway)")
}

highway("build") {
    print("Building...")
    try sh("swift", "build")
}

highway("test") {
    try sh("swift", "test")
}

highway("deploy") {
    print("Deploying...")
}

highway("release", dependsOn: ["build", "deploy"]) {
    print("Releasing...")
}

afterAll { highway in
    print("Successfully drove highway: \\(highway)")
}

onError { highway, error in
    print("Error driving highway: \\(highway)")
    print("Error: \\(error.localizedDescription)")
}
"""

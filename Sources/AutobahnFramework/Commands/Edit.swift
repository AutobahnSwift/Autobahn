import Foundation
import Console

public final class Edit: Command {
    public let id = "edit"
    public let help: [String] = ["Opens Autobahn.swift in Xcode playground with autocomplete"]
    public let signature: [Argument] = [
        Option(name: "path", help: ["Location of your Autobahn.swift file"])
    ]
    public let console: ConsoleProtocol

    public init(console: ConsoleProtocol) {
        self.console = console
    }

    public func run(arguments: [String]) throws {
        print("edit command ran!")
    }
}

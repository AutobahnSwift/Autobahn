import Foundation
import Console

public final class Actions: Command {
    public let id = "actions"
    public let help: [String] = ["prints a list of available Autobahn actions"]
    public let console: ConsoleProtocol

    public init(console: ConsoleProtocol) {
        self.console = console
    }

    public func run(arguments: [String]) throws {
        print("actions command ran!")
    }
}

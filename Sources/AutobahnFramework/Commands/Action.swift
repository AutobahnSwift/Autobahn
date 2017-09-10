import Foundation
import Console

public final class Action: Command {
    public let id = "action"
    public let help: [String] = ["Gives more info about a specific Autobahn action"]
    public let console: ConsoleProtocol

    public init(console: ConsoleProtocol) {
        self.console = console
    }

    public func run(arguments: [String]) throws {
        print("action command ran!")
    }
}

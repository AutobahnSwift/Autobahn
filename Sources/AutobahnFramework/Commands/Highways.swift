import Foundation
import Console

public final class Highways: Command {
    public let id = "highways"
    public let help: [String] = ["Lists all available highways and their description"]
    public let console: ConsoleProtocol

    public init(console: ConsoleProtocol) {
        self.console = console
    }

    public func run(arguments: [String]) throws {
        print("highways command ran!")
    }
}


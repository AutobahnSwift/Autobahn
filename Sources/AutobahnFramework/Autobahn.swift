#if os(Linux)
    import Glibc
#else
    import Darwin.C
#endif

import Foundation
import Console

public enum AutobahnError: Error {
    case general(String)
}

public final class Autobahn {

    public static func run() {
        var args = CommandLine.arguments
        let executable = args.removeFirst()

        let terminal = Terminal(arguments: args)

        let group = Group(id: executable, commands: [
//                Action(console: terminal),
//                Actions(console: terminal),
//                Highways(console: terminal),
                Drive(console: terminal),
//                Edit(console: terminal),
                Init(console: terminal),
            ], help: [
                "CLI for 'autobahn' - The swiftiest way to automate mundane developer tasks for your iOS apps",
            ], fallback: Drive(console: terminal))

        do {
            try terminal.run(group, arguments: args)
        } catch AutobahnError.general(let message) {
            terminal.error("Error: ", newLine: false)
            terminal.print(message)
            exit(1)
        } catch ConsoleError.insufficientArguments {
            terminal.error("Error: ", newLine: false)
            terminal.print("Insufficient arguments.")
        } catch ConsoleError.help {
            exit(0)
        } catch ConsoleError.cancelled {
            print("Cancelled")
            exit(2)
        } catch ConsoleError.noCommand {
            terminal.error("Error: ", newLine: false)
            terminal.print("No command supplied.")
        } catch ConsoleError.commandNotFound(let id) {
            terminal.error("Error: ", newLine: false)
            terminal.print("Command \"\(id)\" not found.")
        } catch {
            terminal.error("Error: ", newLine: false)
            terminal.print("\(error)")
            exit(1)
        }
    }
}

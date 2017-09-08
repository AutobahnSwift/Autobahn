import Foundation

public enum ShellError: Error {
    case nonZeroExitCode(String)
}

public enum Shell {
    public static func run(_ cmd: String, args: [String]) throws {
        let proc = Process()
        proc.launchPath = "/usr/bin/env"
        proc.arguments = [cmd] + args
        proc.launch()
        proc.waitUntilExit()

        guard proc.terminationStatus == 0 else {
            throw ShellError.nonZeroExitCode("Shell command returned with non zero exit code")
        }
    }
}

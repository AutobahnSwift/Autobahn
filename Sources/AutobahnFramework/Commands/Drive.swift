import Foundation
import Console

public final class Drive: Command {
    public let id = "drive"
    public let help: [String] = ["*Drive a specific highway"]
    public let signature: [Argument] = [
        Value(name: "highway", help: [
            "The name of the highway you would like to drive",
        ]),

    ]
    public let console: ConsoleProtocol

    private let supportedPaths = ["Autobahn.swift", "autobahn/Autobahn.swift", "Autobahn/Autobahn.swift", ".autobahn/Autobahn.swift"]
    // Finds first occurrence of supported path
    private var resolvedPath: String? {
        return supportedPaths.first { path in
            return FileManager.default.fileExists(atPath: path)
        }
    }

    public init(console: ConsoleProtocol) {
        self.console = console
    }

    public func run(arguments: [String]) throws {
        // Exit if a Autobahn.swift was not found at any supported path
        guard let autobahnFilePath = resolvedPath else {
            print("Could not find a Autobahn.swift")
            print("Please use a supported path: \(supportedPaths)")
            exit(0)
        }

        var args = [String]()
        args += ["--driver-mode=swift"] // Eval in swift mode, I think?
        args += ["-L", ".build/debug"] // Find libs inside this folder (may need to change in production)
        args += ["-I", ".build/debug"] // Find libs inside this folder (may need to change in production)
        //args += ["-L", "/usr/local/lib"]
        //args += ["-I", "/usr/local/lib"]
        args += ["-lAutobahnDescription"] // Eval the code with the Target Autobahn added
//        verbose ? args += ["-v"] : ()
        args += [autobahnFilePath] // The Autobahn.swift

        args += arguments

        let cmd = "/usr/bin/swiftc"
//        verbose ? print("Command: \(cmd) \(args.joined(separator: " "))") : ()
        let proc = Process()
        proc.launchPath = cmd
        proc.arguments = args
        proc.launch()
        proc.waitUntilExit()
    }
}

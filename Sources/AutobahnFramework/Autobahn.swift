#if os(Linux)
    import Glibc
#else
    import Darwin.C
#endif

import Foundation


public final class Autobahn {
    public static func run() throws {
        let verbose = CommandLine.arguments.contains("-v")

        // Finds first occurrence of supported path
        let supportedPaths = ["Autobahn.swift", "autobahn/Autobahn.swift", "Autobahn/Autobahn.swift", ".autobahn/Autobahn.swift"]

        let resolvedPath = supportedPaths.first { path in
            return FileManager.default.fileExists(atPath: path)
        }

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
        verbose ? args += ["-v"] : ()
        args += [autobahnFilePath] // The Autobahn.swift

        if CommandLine.arguments.count > 1, CommandLine.arguments[1] != "-v" {
            args += [CommandLine.arguments[1]]
        }

        let cmd = "/usr/bin/swiftc"
        verbose ? print("Command: \(cmd) \(args.joined(separator: " "))") : ()
        let proc = Process()
        proc.launchPath = cmd
        proc.arguments = args
        proc.launch()
        proc.waitUntilExit()

    }
}

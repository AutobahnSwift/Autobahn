#if os(Linux)
    import Glibc
#else
    import Darwin.C
#endif

import Foundation
import Actions


private final class AutobahnDescription {
    let version = "0.0.1"

    static let shared = AutobahnDescription()

    var currentTask: String
    var beforeAllHandler: ((String) throws -> Void)?
    var tasks = [String:() throws -> Void]()
    var afterAllHandler: ((String) throws -> Void)?
    var onErrorHandler: ((String, Error) -> Void)?

    private init() {
        let args = CommandLine.arguments
        currentTask = args.count > 1 ? args[1] : "run"

        dumpResultsAtExit(self, path: ".")
    }
}

// MARK: - Public Functions

public func beforeAll(handler: @escaping (String) throws -> Void) {
    guard AutobahnDescription.shared.beforeAllHandler == nil else {
        fatalError("beforeAll declared more than once")
    }
    AutobahnDescription.shared.beforeAllHandler = handler
}

public enum TaskError: Error {
    case taskNotFound
}

public func task(_ name: String, dependsOn: [String] = [], taskHandler: @escaping () throws -> Void) {
    AutobahnDescription.shared.tasks[name] = taskHandler
}

public func sh(_ cmd: String, _ args: String...) throws {
    try Shell.run(cmd, args: args)
}

public func afterAll(handler: @escaping (String) throws -> Void) {
    guard AutobahnDescription.shared.afterAllHandler == nil else {
        fatalError("afterAll declared more than once")
    }
    AutobahnDescription.shared.afterAllHandler = handler
}

public func onError(handler: @escaping (String, Error) -> Void) {
    guard AutobahnDescription.shared.onErrorHandler == nil else {
        fatalError("onError declared more than once")
    }
    AutobahnDescription.shared.onErrorHandler = handler
}

// MARK: - Private Functions

private var dumpInfo: (autobahn: AutobahnDescription, path: String)?

private func dumpResultsAtExit(_ runner: AutobahnDescription, path: String) {
    func dump() {
        guard let dumpInfo = dumpInfo else { return }
//        print("Sending results back to Autobahn")
        let autobahn = dumpInfo.autobahn

        do {
            try autobahn.beforeAllHandler?(autobahn.currentTask)
            guard let task = autobahn.tasks[autobahn.currentTask] else {
                throw TaskError.taskNotFound
            }
            try task()
            try autobahn.afterAllHandler?(autobahn.currentTask)
        } catch {
            autobahn.onErrorHandler?(autobahn.currentTask, error)
        }
    }
    dumpInfo = (runner, path)
    atexit(dump)
}

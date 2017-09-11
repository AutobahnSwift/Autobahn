#if os(Linux)
    import Glibc
#else
    import Darwin.C
#endif

import Foundation
@_exported import Actions

private extension Array {
    var second: Element? {
        guard count > 1 else {
            return nil
        }
        return self[1]
    }
}

/// Highway is the protocol which every highway should follow.
///
/// We suggest defining the highways as an enum like this:
///
/// ```Swift
/// enum MyHighways {
///     case build, test, deploy, release
///
///     var usage: String {
///         switch self {
///         case .build: return "This is how you should use build:…"
///         // … handle all cases
///     }
/// }
/// ```
public protocol Highway: RawRepresentable, Hashable where RawValue == String {
    var usage: String { get }
}

public extension Highway {
    var usage: String {
        return "No usage specified for \(self)"
    }
}

public final class Autobahn<H: Highway> {
    public let version = "0.1.0"

    private var highwayStart: Date
    private var highwayEnd: Date?
    private var beforeAllHandler: ((H) throws -> Void)?
    private var highways = [H: () throws -> Void]()
    private var dependings = [H: [H]]()
    private var afterAllHandler: ((H) throws -> Void)?
    private var onErrorHandler: ((String, Error) -> Void)?
    
    // MARK: - Possible errors
    
    public enum HighwayError: Error {
        case noHighwaySpecified
        case noValidHighwayName(String)
        case highwayNotDefined(String)
    }
    
    // MARK: - Public Functions
    
    public init(_ highwayType: H.Type) {
        self.highwayStart = Date()
    }
    
    public func beforeAll(handler: @escaping (H) throws -> Void) -> Autobahn<H> {
        precondition(beforeAllHandler == nil, "beforeAll declared more than once")
        beforeAllHandler = handler
        return self
    }
    
    public func highway(_ highway: H, handler: @escaping () throws -> Void) -> Autobahn<H> {
        self.highways[highway] = handler
        return self
    }

    public func highway(_ highway: H, dependsOn highways: [H]) -> Autobahn<H> {
        dependings[highway] = highways
        return self
    }

    public func highway(_ highway: H, dependsOn highways: [H], handler: @escaping () throws -> Void) -> Autobahn<H> {
        self.highways[highway] = handler
        dependings[highway] = highways
        return self
    }
    
    public func afterAll(handler: @escaping (H) throws -> Void) -> Autobahn<H> {
        precondition(afterAllHandler == nil, "afterAll declared more than once")
        afterAllHandler = handler
        return self
    }
    
    public func onError(handler: @escaping (String, Error) -> Void) -> Autobahn<H> {
        precondition(onErrorHandler == nil, "onError declared more than once")
        onErrorHandler = handler
        return self
    }
    
    public func drive() {
        let args = CommandLine.arguments
        let secondArg = args.second
        
        do {
            guard let raw = secondArg else {
                throw HighwayError.noHighwaySpecified
            }
            guard let currentHighway = H(rawValue: raw) else {
                throw HighwayError.noValidHighwayName(raw)
            }
            try self.beforeAllHandler?(currentHighway)
            try self.driveHighway(currentHighway)
            try self.afterAllHandler?(currentHighway)
        } catch {
            self.onErrorHandler?(secondArg ?? "", error)
        }
        highwayEnd = Date()
    }
    
    // MARK: - private functions
    
    private func driveHighway(_ highway: H) throws {
        if let dependings = self.dependings[highway] {
            for dependingHighway in dependings {
                guard let d = self.highways[dependingHighway] else {
                    throw HighwayError.highwayNotDefined(dependingHighway.rawValue)
                }
                printHeader(for: dependingHighway)
                try d()
            }
        }
        if let handler = highways[highway] {
            printHeader(for: highway)
            try handler()
        }
    }

    private func printHeader(for highway: H) {
        let count = highway.rawValue.count
        print("-------------\(String(repeating: "-", count: count))----")
        print("--- Highway: \(highway.rawValue) ---")
        print("-------------\(String(repeating: "-", count: count))----")
    }
}

public func sh(_ cmd: String, _ args: String...) throws {
    try ShellCommand.run(cmd, args: args)
}

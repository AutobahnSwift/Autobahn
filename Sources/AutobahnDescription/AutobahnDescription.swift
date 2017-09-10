#if os(Linux)
    import Glibc
#else
    import Darwin.C
#endif

import Foundation
import Actions

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
    let version = "0.1.0"

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
    
    public init(_ highwayType: H.Type) {}
    
    public func beforeAll(handler: @escaping (H) throws -> Void) -> Autobahn<H> {
        guard self.beforeAllHandler == nil else {
            fatalError("beforeAll declared more than once")
        }
        self.beforeAllHandler = handler
        return self
    }
    
    public func highway(_ highway: H, dependsOn: [H]? = nil, taskHandler: @escaping () throws -> Void) -> Autobahn<H> {
        self.highways[highway] = taskHandler
        if let d = dependsOn {
            self.dependings[highway] = d
        }
        return self
    }
    
    public func afterAll(handler: @escaping (H) throws -> Void) -> Autobahn<H> {
        guard self.afterAllHandler == nil else {
            fatalError("afterAll declared more than once")
        }
        self.afterAllHandler = handler
        return self
    }
    
    public func onError(handler: @escaping (String, Error) -> Void) -> Autobahn<H> {
        guard self.onErrorHandler == nil else {
            fatalError("onError declared more than once")
        }
        self.onErrorHandler = handler
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
    }
    
    // MARK: - private functions
    
    private func driveHighway(_ highway: H) throws {
        guard let highwayHandler = self.highways[highway] else {
            throw HighwayError.highwayNotDefined(highway.rawValue)
        }
        if let dependings = self.dependings[highway] {
            for dependingHighway in dependings {
                guard let d = self.highways[dependingHighway] else {
                    throw HighwayError.highwayNotDefined(dependingHighway.rawValue)
                }
                try d()
            }
        }
        try highwayHandler()
    }
}

public func sh(_ cmd: String, _ args: String...) throws {
    try Shell.run(cmd, args: args)
}

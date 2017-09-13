import Foundation

public enum ActionCategory {
    case testing
    case building
    case screenshots
    case project
    case codeSigning
    case documentation
    case beta
    case push
    case production
    case sourceControl
    case notifications
    case misc
    case deprecated
}

public struct Option {
    let key: String
    let envName: String?
    let description: String?

    init(key: String, envName: String? = nil, description: String? = nil) {
        self.key = key
        self.envName = envName
        self.description = description
    }
}

public protocol ActionError: Error {

}

public protocol Action {
    var id: String { get }
    var description: String { get }
    var codeExamples: [String] { get }
    var authors: [String] { get }
    var options: [Option] { get }
}

public extension Action {
    var id: String {
        return String(describing: Self.self)
    }
    var description: String { return "" }
    var codeExamples: [String] { return [] }
    var authors: [String] { return [] }
}

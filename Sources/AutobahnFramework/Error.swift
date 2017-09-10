

public enum AutobahnError: Error {
    case general(String, help: String)

    var error: String {
        switch self {
        case .general(let error, _): return error
        }
    }
    var helpMessage: String {
        switch self {
        case .general(_, let help): return help
        }
    }
}

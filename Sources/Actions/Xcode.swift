import Foundation

public enum XcodeError: ActionError {

}

public enum XcodeProject {
    public static var versionNumber: String {
        return "0.1.0"
    }
    public static var buildNumber: String {
        return "0"
    }
}

public enum XcodeWorkspace {
    public static var schemes: [String] {
        return [""]
    }
}

import Foundation

public enum FastlaneError: ActionError {

}

enum Fastlane {
    static func lane(_ name: String) throws {
        try ShellCommand.run("fastlane", args: [name])
    }

    static func lane(_ name: String, platform: String) throws {
        try ShellCommand.run("fastlane", args: [platform, name])
    }
}

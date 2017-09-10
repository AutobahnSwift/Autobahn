import Foundation

enum Fastlane {
    static func lane(_ name: String) throws {
        try Shell.run("fastlane", args: [name])
    }

    static func lane(_ name: String, platform: String) throws {
        try Shell.run("fastlane", args: [platform, name])
    }
}

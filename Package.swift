// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Autobahn",
    products: [
        .executable(name: "autobahn", targets: ["autobahn"]),
        .library(name: "AutobahnDescription", type: .dynamic, targets: ["AutobahnDescription"]),
    ],
    dependencies: [
//        .package(url: "https://github.com/swift-xcode/xcodeproj.git", .upToNextMajor(from: "0.1.2")),
        .package(url: "https://github.com/kdawgwilk/Shuttle.git", .branch("master")),
        .package(url: "https://github.com/vapor/console.git", .upToNextMajor(from: "2.2.0")),
//        .package(url: "https://github.com/Quick/Quick.git", .branch("support-swift-4")),
//        .package(url: "https://github.com/Quick/Nimble.git", .branch("support-swift-4")),
//        .package(url: "https://github.com/JohnSundell/Files.git", .upToNextMajor(from: "1.11.0")),
//        .package(url: "https://github.com/JohnSundell/ShellOut.git", .upToNextMajor(from: "1.2.1")),
    ],
    targets: [
        .target(name: "autobahn", dependencies: ["AutobahnFramework"]),
        .target(name: "AutobahnDescription", dependencies: ["Actions"]),
        .target(name: "AutobahnFramework", dependencies: ["Console", "AutobahnDescription"]),
        .target(name: "Actions", dependencies: []),//["Shuttle", "xcodeproj"]),

        .testTarget(name: "AutobahnDescriptionTests", dependencies: ["AutobahnDescription"]),
        .testTarget(name: "AutobahnFrameworkTests", dependencies: ["AutobahnFramework"]),
        .testTarget(name: "ActionsTests", dependencies: ["Actions"]),
    ],
    swiftLanguageVersions: [3, 4]
)

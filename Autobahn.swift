import Foundation
import AutobahnDescription

enum Highway: String, AutobahnDescription.Highway {
	case build, buildRelease
	case test
	case ci
	case deploy, release
	case experiments
}

Autobahn(Highway.self)

.beforeAll { highway in

}

.highway(.build) {
	print("Building...")
	try sh("swift", "build", "--enable-prefetching")
}

.highway(.buildRelease) {
	try sh("swift", "build", "--enable-prefetching", "-c", "release", "--static-swift-stdlib")
}

.highway(.test) {
	try sh("swift", "test", "--enable-prefetching")
}

.highway(.ci, dependsOn: [.buildRelease, .test])

.highway(.deploy) {
	print("Deploying...")
}

.highway(.release, dependsOn: [.build, .deploy]) {
	print("Releasing...")
}

.highway(.experiments) {
	try ShellCommand.run("swift", args: ["test"])
}

.afterAll { highway in
	print("Successfully drove highway: \(highway)")
}

.onError { name, error in
	print("Error driving highway: \(name)")
	print("Error: \(error)")
}

.drive()

import Foundation
import AutobahnDescription

enum Highway: String, AutobahnDescription.Highway {
	case build, buildRelease, test, deploy, release
}

Autobahn(Highway.self)

.beforeAll { highway in
	print("Driving highway: \(highway)")
}

.highway(.build) {
	print("Building...")
	try sh("swift", "build")
}

.highway(.buildRelease) {
	print("Building...")
	try sh("swift", "build", "-c", "release", "--static-swift-stdlib")
}

.highway(.test) {
	try sh("swift", "test")
}

.highway(.deploy) {
	print("Deploying...")
}

.highway(.release, dependsOn: [.build, .deploy]) {
	print("Releasing...")
}

.afterAll { highway in
	print("Successfully drove highway: \(highway)")
}

.onError { name, error in
	print("Error driving highway: \(name)")
	print("Error: \(error)")
}

.drive()

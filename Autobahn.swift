import Foundation
import AutobahnDescription

enum Highway: String, AutobahnDescription.Highway {
	case build, buildRelease
	case test
	case ci
	case deploy, release
}

Autobahn(Highway.self)

.beforeAll { highway in

}

.highway(.build) {
	print("Building...")
	try sh("swift", "build")
}

.highway(.buildRelease) {
	try sh("swift", "build", "-c", "release")
}

.highway(.test) {
	try sh("swift", "test")
}

.highway(.ci, dependsOn: [.buildRelease, .test])

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

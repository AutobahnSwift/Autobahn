import Foundation
import AutobahnDescription

// let autobahn = Autobahn()
// autoban.defaultTask = "release"


beforeAll { highway in
	print("Driving highway: \(highway)")
}

highway("build") {
	print("Building...")
	try sh("swift", "build")
}

highway("test") {
	try sh("swift", "test")
}

highway("deploy") {
	print("Deploying...")
}

highway("release", dependsOn: ["build", "deploy"]) {
	print("Releasing...")
}

afterAll { highway in
	print("Successfully ran task: \(highway)")
}

onError { highway, error in
	print("Error driving highway: \(highway)")
	print("Error: \(error.localizedDescription)")
}
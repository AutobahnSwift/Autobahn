import Foundation
import AutobahnDescription

// let condor = Condor()
// condor.defaultTask = "release"


beforeAll { task in
	print("Running task: \(task)")
}

task("build") {
	print("Building...")
	try sh("swift", "build")
}

task("test") {
	try sh("swift", "test")
}

task("deploy") {
	print("Deploying...")
}

task("release", dependsOn: ["build", "deploy"]) {
	print("Releasing...")
}

afterAll { task in
	print("Successfully ran task: \(task)")
}

onError { task, error in
	print("Error running task: \(task)")
	print("Error: \(error.localizedDescription)")
}
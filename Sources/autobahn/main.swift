import Foundation
import AutobahnFramework

do {
    print("Autobahn v0.1.0")
    try Autobahn.run()
} catch {
    let errorData = "\(error)\n".data(using: .utf8)!
    FileHandle.standardError.write(errorData)
    exit(1)
}

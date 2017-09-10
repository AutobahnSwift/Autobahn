
<h1 align="center">Autobahn</h1>

<p align="center">
    <!-- <a href="https://travis-ci.org/kdawgwilk/Autobahn/branches">
        <img src="https://img.shields.io/travis/kdawgwilk/Autobahn.svg" alt="Travis status" />
    </a> -->
    <!-- <a href="https://travis-ci.org/kdawgwilk/Autobahn/branches">
        <img src="https://img.shields.io/circleci/project/github/kdawgwilk/Autobahn.svg" alt="CircleCI status" />
    </a> -->
    <!-- <a href=""> -->
        <!-- <img src="https://img.shields.io/codecov/c/github/kdawgwilk/Autobahn.svg" alt="Code coverage" /> -->
    <!-- </a> -->
    <img src="https://img.shields.io/badge/version-0.1.0-blue.svg" alt="Version" />
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-4.0-brightgreen.svg" alt="Swift 4.0">
    </a>
    <!-- <a href="https://kdawgwilk.github.com/autobahn/docs">
        <img src="http://img.shields.io/badge/read_the-docs-lightgrey.svg" alt="Docs">
    </a> -->
    <a href="https://github.com/kdawgwilk/Autobahn/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-green.svg" alt="License" />
    </a>
    <a href="https://twitter.com/kdawgwilk">
        <img src="https://img.shields.io/badge/contact-@Kdawgwilk-blue.svg" alt="Twitter: @kdawgwilk" />
    </a>
</p>

Autobahn is a set of tools (written in Swift) heavily inspired by [fastlane](https://github.com/fastlane/fastlane) to automate many day to day tasks associated with development of apps in the Apple ecosystem.  Currently most progess has been made on a sub package called [Shuttle](https://github.com/kdawgwilk/Shuttle) that is basically a port of fastlane's [spaceship](https://github.com/fastlane/fastlane/tree/master/spaceship) which is an HTTP client for interacting with the Apple Developer portal and iTunesConnect.

>NOTE: This is still a work in progress and there is still much to do, here is a rough list of things I would like to see in the near future

### ToDO List:

- [x] DSL for defining `highways`
- [ ] >90% Code Coverage
- [ ] CLI tool
  - [x] `drive <highway>` drives the highway specified
    - [ ] need to make this the default still
  - [x] `init` creates template `Autobahn.swift` file
  - [ ] `edit` command that creates a temp playground with autocomplete working for Autobahn.swift
  - [ ] `verbose` obviously
  - [ ] `actions` lists all available actions
  - [ ] `action <action_name>` that describes the action
  - [x] `help` to explain how each command works
- [x] Autobahn.swift config file see [danger-swift](https://github.com/danger/danger-swift)
- [ ] Homebrew install support
- [ ] Plugin architecture
- [ ] Git support
- [ ] Support `.env`


## Usage

```
$ autobahn [highway]
```

## Example Autobahn.swift

```swift
import AutobahnDescription


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
  print("Successfully drove highway: \(highway)")
}

onError { highway, error in
  print("Error driving highway: \(highway)")
  print("Error: \(error.localizedDescription)")
}
```

## Installation

TODO: Not supported quite yet

```
$ brew tap kdawgwilk/homebrew-tap
$ brew install autobahn
```

### Development

```sh
$ git clone https://github.com/kdawgwilk/Autobahn.git
$ cd Autobahn
$ swift build

# You can run the cli from the build dir like this:
# .build/debug/autobahn <highway_name>
$ .build/debug/autobahn build

# Or I find it helpful to symlink to `/usr/local/bin` so I can run it directly
$ ln -s `pwd`/.build/debug/autobahn /usr/local/bin/autobahn

# autobahn <highway_name>
$ autobahn build
```

### 🚀 Contributing

All developers should feel welcome and encouraged to contribute to Autobahn, see our [getting started](/CONTRIBUTING.md) document here to get involved.

### 💙 Code of Conduct

Our goal is to create a safe and empowering environment for anyone who decides to use or contribute to Autobahn. Please help us make the community a better place by abiding to this [Code of Conduct](/CODE_OF_CONDUCT.md) during your interactions surrounding this project.

> This project is in no way affiliated with Apple Inc.
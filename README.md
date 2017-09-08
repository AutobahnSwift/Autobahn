
<h1 align="center">Autobahn</h1>

<p align="center">
    <a href="https://travis-ci.org/kdawgwilk/Autobahn/branches">
        <img src="https://img.shields.io/travis/kdawgwilk/Autobahn.svg" alt="Travis status" />
    </a>
    <a href="https://travis-ci.org/kdawgwilk/Autobahn/branches">
        <img src="https://img.shields.io/circleci/project/github/kdawgwilk/Autobahn.svg" alt="CircleCI status" />
    </a>
    <!-- <a href=""> -->
        <img src="https://img.shields.io/codecov/c/github/kdawgwilk/Autobahn.svg" alt="Code coverage" />
    <!-- </a> -->
    <!-- <a href=""> -->
        <img src="https://img.shields.io/badge/version-0.1.0-blue.svg" alt="Version" />
    <!-- </a> -->
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-4.0-brightgreen.svg" alt="Swift 4.0">
    </a>
    <a href="https://kdawgwilk.github.com/autobahn/docs">
        <img src="http://img.shields.io/badge/read_the-docs-lightgrey.svg" alt="Docs">
    </a>
    <a href="https://github.com/kdawgwilk/Autobahn/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-green.svg" alt="License" />
    </a>
    <a href="https://twitter.com/kdawgwilk">
        <img src="https://img.shields.io/badge/contact-@Kdawgwilk-blue.svg" alt="Twitter: @kdawgwilk" />
    </a>
</p>

Autobahn is a set of tools (written in Swift) heavily inspired by [fastlane](https://github.com/fastlane/fastlane) to automate many day to day tasks associated with development of apps in the Apple ecosystem.  Currently most progess has been made on a sub package called [Shuttle](/Shuttle.md) that is basically a port of fastlane's [spaceship](https://github.com/fastlane/fastlane/tree/master/spaceship) which is an HTTP client for interacting with the Apple Developer portal and iTunesConnect.

>NOTE: This is still a work in progress and there is still much to do, here is a rough list of things I would like to see in the near future

### ToDO List:

- [ ] Support all API endpoints [listed below](#api-endpoints)
- [ ] >90% Code Coverage
- [ ] CLI tool
- [ ] Autobahn.swift config file see [danger-swift](https://github.com/danger/danger-swift)
- [ ] DSL for defining `highways`
- [ ] Plugin architecture
- [ ] Git support


## Usage

```
$ autobahn [highway]
```

## Installation

```
$ brew install autobahn
```

## API Endpoints

Overview of the used API endpoints

- `https://idmsa.apple.com`: Used to authenticate to get a valid session
- `https://developerservices2.apple.com`:
  - Get a list of all available provisioning profiles
  - Register new devices
- `https://developer.apple.com`:
  - List all devices, certificates, apps and app groups
  - Create new certificates, provisioning profiles and apps
  - Disable/enable services on apps and assign them to app groups
  - Delete certificates and apps
  - Repair provisioning profiles
  - Download provisioning profiles
  - Team selection
- `https://itunesconnect.apple.com`:
  - Managing apps
  - Managing beta testers
  - Submitting updates to review
  - Managing app metadata
- `https://du-itc.itunesconnect.apple.com`:
  - Upload icons, screenshots, trailers ...

### 🚀 Contributing

All developers should feel welcome and encouraged to contribute to Autobahn, see our [getting started](/CONTRIBUTING.md) document here to get involved.

### 💙 Code of Conduct

Our goal is to create a safe and empowering environment for anyone who decides to use or contribute to Autobahn. Please help us make the community a better place by abiding to this [Code of Conduct](/CODE_OF_CONDUCT.md) during your interactions surrounding this project.

> This project is in no way affiliated with Apple Inc.
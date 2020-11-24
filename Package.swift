// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "GaldinerisGithubIo",
    products: [
        .executable(
            name: "GaldinerisGithubIo",
            targets: ["GaldinerisGithubIo"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.6.0")
    ],
    targets: [
        .target(
            name: "GaldinerisGithubIo",
            dependencies: ["Publish"]
        )
    ]
)
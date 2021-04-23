// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "TvMazeAppLib",
  platforms: [.iOS(.v13)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(name: "TvMazeAppLib", targets: ["TvMazeAppLib"]),
    .library(name: "TvMazeApiClient", targets: ["TvMazeApiClient"]),
  ],
  dependencies: [
    .package(
      name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
      from: "1.8.1"),
    .package(url: "https://github.com/roberthein/TinyConstraints", from: "4.0.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "TvMazeAppLib",
      dependencies: [
        "TvMazeApiClient",
        "TinyConstraints",
      ]
    ),
    .testTarget(
      name: "TvMazeAppLibTests",
      dependencies: ["TvMazeAppLib"]),

    // TvMazeApiClient
    .target(name: "TvMazeApiClient"),
    .testTarget(
      name: "TvMazeApiClientTests",
      dependencies: ["TvMazeApiClient", "SnapshotTesting"]
    ),
  ]
)

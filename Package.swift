// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MyCloudAPI",
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .library(
      name: "MyCloudAPI",
      targets: ["MyCloudAPI"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    
    .package(url: "https://github.com/myste1tainn/RxNetworking.git", from: "0.1.0"),
    
    .package(url: "https://github.com/ReactiveX/RxSwift", from: "4.5.0"),
    
    .package(url: "https://github.com/quick/Quick.git", from: "1.0.0"),
    .package(url: "https://github.com/quick/Nimble.git", from: "7.0.0"),
    
    .package(url: "https://github.com/myste1tainn/RxQuickNimble.git", from: "0.1.0")
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
      name: "MyCloudAPI",
      dependencies: ["RxNetworking"]),
    .testTarget(
      name: "MyCloudAPITests",
      dependencies: ["MyCloudAPI", "RxBlocking", "RxTest", "RxQuickNimble", "Quick", "Nimble"]),
  ]
)


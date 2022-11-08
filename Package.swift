// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxReachability",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v11),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "RxReachability",
            targets: ["RxReachability"])
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMajor(from: "6.5.0")),
        .package(url: "https://github.com/ashleymills/Reachability.swift", .upToNextMajor(from: "5.1.0")),
    ],
    targets: [
        .target(
            name: "RxReachability",
            dependencies: [
                "RxSwift",
                .product(name: "Reachability", package: "Reachability.swift"),
                .product(name: "RxCocoa", package: "RxSwift")
        ]),

        // MARK: SwiftPM tests
        .testTarget(
            name: "RxReachabilityTests",
            dependencies: [
            "RxReachability",
            .product(name: "RxBlocking", package: "RxSwift")
            ]),
    ]
)

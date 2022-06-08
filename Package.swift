// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "mvt-tools",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "MVTTools",
            targets: ["MVTTools"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Outdooractive/gis-tools", from: "0.3.4"),
        .package(name: "SwiftProtobuf", url: "https://github.com/apple/swift-protobuf", from: "1.19.0"),
        .package(url: "https://github.com/1024jp/GzipSwift.git", from: "5.2.0"),
    ],
    targets: [
        .target(
            name: "MVTTools",
            dependencies: [
                .product(name: "GISTools", package: "gis-tools"),
                .byName(name: "SwiftProtobuf"),
                .product(name: "Gzip", package: "GzipSwift"),
            ],
            swiftSettings: [
                // Remove when updating to Swift 6
//                .unsafeFlags(["-Xfrontend", "-warn-concurrency", "-Xfrontend", "-enable-actor-data-race-checks"], .when(configuration: .debug))
            ]),
        .testTarget(
            name: "MVTToolsTests",
            dependencies: ["MVTTools"],
            exclude: ["TestData"]),
    ]
)

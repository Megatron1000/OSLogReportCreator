// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OSLogReportCreator",
    platforms: [.iOS(.v15), .tvOS(.v15), .macOS(.v12), .macCatalyst(.v15)],
    products: [
        .library(
            name: "OSLogReportCreator",
            targets: ["OSLogReportCreator"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "OSLogReportCreator",
            dependencies: []),
    ]
)

// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KMViewsKit",
    products: [
        .library(
            name: "KMViewsKit",
            targets: ["KMViewsKit"]),
    ],
    targets: [
        .target(
            name: "KMViewsKit"),
        .testTarget(
            name: "KMViewsKitTests",
            dependencies: ["KMViewsKit"]),
    ]
)

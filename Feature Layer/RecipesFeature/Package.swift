// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RecipesFeature",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "RecipesFeature",
            targets: ["RecipesFeature"]),
    ],
    dependencies: [
        .package(
            name: "CoreFoundational",
            path: "../../Core Layer/CoreFoundational"
        )
    ],
    targets: [
        .target(
            name: "RecipesFeature",
            dependencies: [
                .product(
                    name: "CoreFoundational",
                    package: "CoreFoundational"
                )
            ]
        ),
        .testTarget(
            name: "RecipesFeatureTests",
            dependencies: ["RecipesFeature"]
        ),
    ]
)

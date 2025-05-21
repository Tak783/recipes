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
        ),
        .package(
            name: "CoreNetworking",
            path: "../../Shared Components Layer/CoreNetworking"
        ),
        .package(
            name: "MockNetworking",
            path: "../../Shared Components Layer/MockNetworking"
        )
    ],
    targets: [
        .target(
            name: "RecipesFeature",
            dependencies: [
                .product(
                    name: "CoreFoundational",
                    package: "CoreFoundational"
                ),
                .product(
                    name: "CoreNetworking",
                    package: "CoreNetworking"
                )
            ]
        ),
        .testTarget(
            name: "RecipesFeatureTests",
            dependencies: [
                "RecipesFeature",
                "CoreNetworking",
                "MockNetworking"
            ]
        ),
    ]
)

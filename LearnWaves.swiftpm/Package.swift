// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "LearnWaves",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "LearnWaves",
            targets: ["AppModule"],
            bundleIdentifier: "com.iago.WWDC2024-2",
            teamIdentifier: "A7SRF7ZP35",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .sparkle),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/AudioKit/AudioKit/", "5.6.3"..<"6.0.0")
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "AudioKit", package: "audiokit")
            ],
            path: ".",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
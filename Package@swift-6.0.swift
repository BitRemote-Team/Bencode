// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Bencode",
    platforms: [
        // Add support for all platforms starting from a specific version.
        .macOS(.v10_13),
        .iOS(.v12),
        .watchOS(.v4),
        .tvOS(.v12)
    ],
    products: [
        .library(name: "Bencode", targets: ["Bencode"])
    ],
    targets: [
        .target(name: "Bencode", dependencies: []),
        .testTarget(
            name: "DecodeTests",
            dependencies: ["Bencode"],
            resources: [.process("sample.torrent")]
        ),
    ]
)

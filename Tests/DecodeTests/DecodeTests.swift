//
//  DecodeTests.swift
//  Bencode
//
//  Created by Tatsuzo on 10/23/24.
//

import Bencode
import Testing
import CryptoKit
import Foundation

struct DecodeTests {
    @Test
    func decodeSampleTorrent() async throws {
        let url = try #require(Bundle.module.url(forResource: "sample", withExtension: "torrent"))
        #expect(Bencode(file: url)?.infoHash == "D6B4535BA8F2B34012BC633569F113E77017E032")
    }
}

private extension Bencode {
    var infoHash: String? {
        dict
            .flatMap { dict in
                (
                    dict.keys.first(where: { $0.key == "info" })
                        .flatMap({ dict[$0] })?
                        .asciiEncoding
                )
                .map(Insecure.SHA1.hash)?
                .hexString
            }
    }
}

public extension Digest {
    var bytes: [UInt8] { Array(makeIterator()) }
    var hexString: String { bytes.map({ String(format: "%02X", $0) }).joined() }
}

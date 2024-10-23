//
//  DecodeTests.swift
//  Bencode
//
//  Created by Tatsuzo on 10/23/24.
//

import Bencode
import Testing
import Foundation

struct DecodeTests {
    @Test
    func decodeSampleTorrent() async throws {
        let url = try #require(Bundle.module.url(forResource: "sample", withExtension: "torrent"))
        _ = Bencode(file: url)

        let data = try Data(contentsOf: url)
        _ = Bencode(bytes: .init(data))
    }
}

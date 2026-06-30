// Pure-Swift SHA-1 and HMAC-SHA1 — no CryptoKit, so the binary links and runs
// on the Linux CI runner. Used only to sign X's OAuth 1.0a requests. Verified
// against the RFC 2202 known-answer vectors, which guarantees byte-for-byte
// parity with node:crypto's HMAC-SHA1 (the implementation it replaces).

enum SHA1 {
    static func hash(_ message: [UInt8]) -> [UInt8] {
        var h0: UInt32 = 0x6745_2301
        var h1: UInt32 = 0xEFCD_AB89
        var h2: UInt32 = 0x98BA_DCFE
        var h3: UInt32 = 0x1032_5476
        var h4: UInt32 = 0xC3D2_E1F0

        // Padding: append 0x80, pad with zeros to 56 mod 64, then the 64-bit
        // big-endian message length in bits.
        var msg = message
        let bitLength = UInt64(message.count) * 8
        msg.append(0x80)
        while msg.count % 64 != 56 {
            msg.append(0x00)
        }
        for shift in stride(from: 56, through: 0, by: -8) {
            msg.append(UInt8((bitLength >> UInt64(shift)) & 0xFF))
        }

        var w = [UInt32](repeating: 0, count: 80)
        for chunkStart in stride(from: 0, to: msg.count, by: 64) {
            for i in 0..<16 {
                let base = chunkStart + i * 4
                w[i] = (UInt32(msg[base]) << 24)
                    | (UInt32(msg[base + 1]) << 16)
                    | (UInt32(msg[base + 2]) << 8)
                    | UInt32(msg[base + 3])
            }
            for i in 16..<80 {
                w[i] = rotateLeft(w[i - 3] ^ w[i - 8] ^ w[i - 14] ^ w[i - 16], by: 1)
            }

            var a = h0, b = h1, c = h2, d = h3, e = h4
            for i in 0..<80 {
                let f: UInt32
                let k: UInt32
                switch i {
                case 0..<20:
                    f = (b & c) | (~b & d)
                    k = 0x5A82_7999
                case 20..<40:
                    f = b ^ c ^ d
                    k = 0x6ED9_EBA1
                case 40..<60:
                    f = (b & c) | (b & d) | (c & d)
                    k = 0x8F1B_BCDC
                default:
                    f = b ^ c ^ d
                    k = 0xCA62_C1D6
                }
                let temp = rotateLeft(a, by: 5) &+ f &+ e &+ k &+ w[i]
                e = d
                d = c
                c = rotateLeft(b, by: 30)
                b = a
                a = temp
            }

            h0 = h0 &+ a
            h1 = h1 &+ b
            h2 = h2 &+ c
            h3 = h3 &+ d
            h4 = h4 &+ e
        }

        var digest = [UInt8]()
        digest.reserveCapacity(20)
        for word in [h0, h1, h2, h3, h4] {
            digest.append(UInt8((word >> 24) & 0xFF))
            digest.append(UInt8((word >> 16) & 0xFF))
            digest.append(UInt8((word >> 8) & 0xFF))
            digest.append(UInt8(word & 0xFF))
        }
        return digest
    }
}

private extension SHA1 {
    static func rotateLeft(_ value: UInt32, by amount: UInt32) -> UInt32 {
        (value << amount) | (value >> (32 - amount))
    }
}

enum HMACSHA1 {
    // HMAC = SHA1(opad ‖ SHA1(ipad ‖ message)) with a 64-byte block.
    static func sign(key: [UInt8], message: [UInt8]) -> [UInt8] {
        let blockSize = 64
        var keyBlock = key.count > blockSize ? SHA1.hash(key) : key
        if keyBlock.count < blockSize {
            keyBlock.append(contentsOf: [UInt8](repeating: 0, count: blockSize - keyBlock.count))
        }
        let inner = SHA1.hash(keyBlock.map { $0 ^ 0x36 } + message)
        return SHA1.hash(keyBlock.map { $0 ^ 0x5C } + inner)
    }
}

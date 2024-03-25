import BitcoinCore

public class MainNet: INetwork {
    
    public let bundleName = "Dogecoin"

    public let pubKeyHash: UInt8 = 0x1e
    public let privateKey: UInt8 = 0xb0
    public let scriptHash: UInt8 = 0x16
    public let bech32PrefixPattern: String = "doge"
    public let xPubKey: UInt32 = 0xfdcafa02// 0x02facafd
    public let xPrivKey: UInt32 = 0x98c3fa02// 0x02fac398
    public let magic: UInt32 = 0xc0c0c0c0
    public let port = 22556
    public let coinType: UInt32 = 3
    public let sigHash: SigHashType = .bitcoinAll
    public var syncableFromApi: Bool = false
    public var blockchairChainId: String = "dogecoin"

    public let dnsSeeds = [
        "seed.multidoge.org",
         "seed2.multidoge.org",
         "seed.doger.dogecoin.com"
    ]

    public let dustRelayTxFee = 3000

    public init() {}

}

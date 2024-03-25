import BitcoinCore
import HdWalletKit
import HsToolKit
import DogecoinKit

class DogecoinAdapter: BaseAdapter {
    let dogecoinKit: Kit

    init(words: [String], purpose: Purpose, testMode: Bool, syncMode: BitcoinCore.SyncMode, logger: Logger) {
        let networkType: Kit.NetworkType = testMode ? .testNet : .mainNet
        guard let seed = Mnemonic.seed(mnemonic: words) else {
            fatalError("Can't Create Seed")
        }

        dogecoinKit = try! Kit(seed: seed, purpose: purpose, walletId: "walletId", syncMode: syncMode, hasher: nil, networkType: networkType, confirmationsThreshold: 1, logger: logger.scoped(with: "DogecoinKit"))

        super.init(name: "Dogecoin", coinCode: "DOGE", abstractKit: dogecoinKit)
        dogecoinKit.delegate = self
    }

    class func clear() {
        try? Kit.clear()
    }
}

extension DogecoinAdapter: BitcoinCoreDelegate {
    func transactionsUpdated(inserted _: [TransactionInfo], updated _: [TransactionInfo]) {
        transactionsSubject.send()
    }

    func transactionsDeleted(hashes _: [String]) {
        transactionsSubject.send()
    }

    func balanceUpdated(balance _: BalanceInfo) {
        balanceSubject.send()
    }

    func lastBlockInfoUpdated(lastBlockInfo _: BlockInfo) {
        lastBlockSubject.send()
    }

    public func kitStateUpdated(state _: BitcoinCore.KitState) {
        syncStateSubject.send()
    }
}

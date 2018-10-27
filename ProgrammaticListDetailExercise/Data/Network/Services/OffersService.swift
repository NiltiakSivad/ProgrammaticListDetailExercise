import Foundation
import RxSwift
import Moya

class OffersService: BaseService {
    var provider: MoyaProvider<OffersEndpoint>

    override init() {
        provider = MoyaProvider<OffersEndpoint>()
        super.init()
    }

    func get() -> Observable<[Offer]> {
        return self.provider.rx.request(OffersEndpoint.get)
            .map([Offer].self, using: self.decoder)
            .asObservable()
    }
}

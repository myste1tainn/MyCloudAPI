//
// Created by Arnon Keereena on 2019-04-16.
//

import Foundation
import RxSwift
import RxMoya
import Moya

/// Represent all APIs (services) exists in mycloud collectively
///
/// While mycloud allows API users to fetch resources from any owner
/// The distinction of which it uses to justify owner (authentication & authorization)
/// is the open authentication token (OAuth token) it offers
/// This means that the user of this APIs wrapper (Moya) has to provider Access Token Plugin
public class APIs: MoyaProvider<ResourceTarget> {
  
  public private(set) static var isProduction: Bool = false
  
  public static func setProduction() {
    isProduction = true
  }
  
  public func authenticate(key: String, secret: String) -> Single<AccessToken> {
    return rx.request(.authenticate(key: key, secret: secret))
             .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
             .map { try $0.toModel(ofType: AccessToken.self) }
  }
  
  public func orders() -> Single<[Order]> {
    return rx.request(.orders(.get))
             .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
             .map { try $0.toModel(ofType: [Order].self) }
  }
  
  public func products() -> Single<[Product]> {
    return rx.request(.products(.get))
             .map { try $0.toModel(ofType: [Product].self) }
  }
  
}

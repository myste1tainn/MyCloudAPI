//
// Created by Arnon Keereena on 2019-04-16.
//

import Foundation
import RxSwift
import RxMoya
import RxNetworking

/// Represent all APIs (services) exists in mycloud collectively
///
/// While mycloud allows API users to fetch resources from any owner
/// The distinction of which it uses to justify owner (authentication & authorization)
/// is the open authentication token (OAuth token) it offers
/// This means that the user of this APIs wrapper (Moya) has to provider Access Token Plugin
public class APIs: HTTPClient<ResourceTarget> {
  
  public private(set) static var isProduction: Bool = false
  
  public static func setProduction() {
    isProduction = true
  }
  
  public func authenticate(key: String, secret: String) -> Single<AccessToken> {
    return request(.authenticate(key: key, secret: secret))
      .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
      .map { try $0.toModel(ofType: AccessToken.self) }
  }
  
  public func orders(count: Int? = nil, offset: Int? = nil) -> Single<[Order]> {
    return request(.orders(.get(count: count, offset: offset)))
      .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
      .map { try $0.toModel(ofType: ArrayResponse<Order>.self) }
      .map { $0.data }
  }
  
  public func products(count: Int? = nil, offset: Int? = nil) -> Single<[Product]> {
    return request(.products(.get(count: count, offset: offset)))
      .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
      .map { try $0.toModel(ofType: ArrayResponse<Product>.self) }
      .map { $0.data }
  }
  
}

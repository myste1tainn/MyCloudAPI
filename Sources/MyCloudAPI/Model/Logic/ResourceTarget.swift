//
// Created by Arnon Keereena on 2019-04-16.
//

import Foundation
import Moya

/// Describe accessible resource on mycloud RESTful APIs
public enum ResourceTarget: TargetType, AccessTokenAuthorizable {
  case authenticate(key: String, secret: String)
  case products(_ spec: APISpecificationMethod)
  case orders(_ spec: APISpecificationMethod)
  
  // MARK: - Target type
  
  public var baseURL: URL {
    let ssl = APIs.isProduction ? "https" : "http"
    let subDomain = APIs.isProduction ? "api" : "testapi"
    return URL(string: "\(ssl)://\(subDomain).mycloudfulfillment.com")!
  }
  
  public var path: String {
    let base = "api/v1"
    switch self {
    case .authenticate: return "\(base)/gettoken"
    case .products: return "\(base)/products"
    case .orders: return "\(base)/orders"
    }
  }
  
  public var method: Moya.Method {
    switch self {
    case .authenticate: return .post
    case .products(let spec), .orders(let spec): return spec.method
    }
  }
  
  public var sampleData: Data {
    fatalError("no sample data")
  }
  
  private func getParams(count: Int?, offset: Int?) -> [String: Any] {
    return [("count", count), ("offset", offset)]
      .filter { $0.1 != nil }
      .reduce(into: [String: Any?]()) { $0[$1.0] = $1.1! }
  }
  
  public var task: Task {
    switch self {
    case .authenticate(let key, let secret):
      return .uploadMultipart([
                                MultipartFormData(provider: .data(key.data(using: .ascii)!), name: "apikey"),
                                MultipartFormData(provider: .data(secret.data(using: .ascii)!), name: "secretkey")
                              ])
    case .orders(let spec):
      switch spec {
      case .get(let count, let offset):
        return .requestParameters(parameters: getParams(count: count, offset: offset), encoding: URLEncoding.default)
      case .post:
        return .requestParameters(parameters: [:], encoding: URLEncoding.default)
      default: return .requestPlain
      }
    case .products(let spec):
      switch spec {
      case .get(let count, let offset):
        return .requestParameters(parameters: getParams(count: count, offset: offset), encoding: URLEncoding.default)
      case .post:
        return .requestParameters(parameters: [:], encoding: URLEncoding.default)
      default: return .requestPlain
      }
    }
  }
  
  public var headers: [String: String]? {
    // TODO: complete header if needed
    return [:]
  }
  
  // MARK: - Access token authorizable
  
  public var authorizationType: AuthorizationType {
    switch self {
    case .authenticate: return .none
    default: return .bearer
    }
  }
}

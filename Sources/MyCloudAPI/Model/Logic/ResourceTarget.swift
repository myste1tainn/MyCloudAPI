//
// Created by Arnon Keereena on 2019-04-16.
//

import Foundation
import Moya

/// Describe accessible resource on mycloud RESTful APIs
public enum ResourceTarget: TargetType {
  case products(_ spec: APISpecificationMethod)
  case orders(_ spec: APISpecificationMethod)
  
  public var baseURL: URL {
    let subDomain = APIs.isProduction ? "api" : "testapi"
    return URL(string: "https://\(subDomain).mycloudfulfillment.com")!
  }
  
  public var path: String {
    switch self {
    case .products: return "products"
    case .orders: return "orders"
    }
  }
  
  public var method: Moya.Method {
    switch self {
    case .products(let spec), .orders(let spec): return spec.method
    }
  }
  
  public var sampleData: Data {
    fatalError("no sample data")
  }
  
  public var task: Task {
    switch self {
    case .orders(let spec):
      switch spec {
        // TODO: Complete URL paramters
      case .post: return .requestParameters(parameters: [:], encoding: URLEncoding.default)
      default: return .requestPlain
      }
    case .products(let spec):
      switch spec {
        // TODO: Complete URL paramters
      case .post: return .requestParameters(parameters: [:], encoding: URLEncoding.default)
      default: return .requestPlain
      }
    }
  }
  
  public var headers: [String: String]? {
    // TODO: complete header if needed
    return [:]
  }
}

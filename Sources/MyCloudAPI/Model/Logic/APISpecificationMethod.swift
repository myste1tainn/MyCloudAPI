//
// Created by Arnon Keereena on 2019-04-16.
//

import Foundation
import RxNetworking

/// Represents RESTful API specification method just like HTTP method
/// but pretty much adheres to how it works for mycloud
/// one can shortly said that it represents "logic translation of HTTP method to RESTful API description"
public enum APISpecificationMethod {
  case get(count: Int?, offset: Int?)
  case post
  case put(id: String)
  case delete(id: String)
  
  public var method: HTTPMethod {
    switch self {
    case .get: return .get
    case .post: return .post
    case .put: return .put
    case .delete: return .delete
    }
  }
}

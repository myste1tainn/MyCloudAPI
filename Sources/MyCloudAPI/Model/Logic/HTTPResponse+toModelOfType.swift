//
// Created by Arnon Keereena on 2019-04-08.
//

import Foundation
import RxNetworking

extension HTTPResponse {
  public func toModel<T: Decodable>(ofType type: T.Type) throws -> T {
    if statusCode < 300 {
      do {
        return try map(type)
      } catch {
        throw MyCloudAPIError.responseDecoding(response: self, baseError: error)
      }
    } else {
      let maybeErrorResponse = try? map(ErrorResponse.self)
      if statusCode == 401 {
        throw MyCloudAPIError.unauthorized(error: maybeErrorResponse)
      } else if statusCode == 403 {
        throw MyCloudAPIError.forbidden(error: maybeErrorResponse)
      } else if let error = maybeErrorResponse {
        throw error
      } else {
        throw MyCloudAPIError.responseDecoding(response: self, baseError: nil)
      }
    }
  }
}

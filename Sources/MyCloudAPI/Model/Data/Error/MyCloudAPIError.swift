//
// Created by Arnon Keereena on 2019-04-17.
//

import Foundation
import Moya

public enum MyCloudAPIError: Swift.Error {
  case responseDecoding(response: Moya.Response, baseError: Swift.Error?)
  case unauthorized(error: ErrorResponse?)
  case forbidden(error: ErrorResponse?)
}

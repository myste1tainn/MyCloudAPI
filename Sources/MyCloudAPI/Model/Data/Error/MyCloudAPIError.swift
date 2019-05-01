//
// Created by Arnon Keereena on 2019-04-17.
//

import Foundation
import RxNetworking

public enum MyCloudAPIError: Swift.Error {
  case responseDecoding(response: HTTPResponse, baseError: Swift.Error?)
  case unauthorized(error: ErrorResponse?)
  case forbidden(error: ErrorResponse?)
}

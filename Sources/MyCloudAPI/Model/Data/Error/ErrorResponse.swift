//
// Created by Arnon Keereena on 2019-04-17.
//

import Foundation

public struct ErrorResponse: Decodable, Error {
  public var message: String?
  
  enum CodingKeys: CodingKey {
    case message
  }
  
  public var localizedDescription: String {
    return message ?? "(nil)"
  }
}

//
// Created by Arnon Keereena on 2019-04-17.
//

import Foundation

public struct AccessToken: Decodable {
  public var token: String?
  
  enum CodingKeys: CodingKey {
    case token
  }
}

//
// Created by Arnon Keereena on 2019-04-18.
//

import Foundation

public struct Customer: Decodable {
  public var attributes: Attributes
  
  enum CodingKeys: CodingKey {
    case attributes
  }
}

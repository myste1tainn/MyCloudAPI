//
// Created by Arnon Keereena on 2019-04-17.
//

import Foundation

public struct OrderItem: Decodable {
  public var attributes: Attributes?
  public var product: Product?
  
  enum CodingKeys: String, CodingKey {
    case attributes = "attributes"
    case product = "product"
  }
}

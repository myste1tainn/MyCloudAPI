//
// Created by Arnon Keereena on 2019-04-18.
//

import Foundation

extension OrderItem {
  public struct Attributes: Decodable {
    public var id: Int?
    public var price: Int?
    public var quantity: Int?
    
    enum CodingKeys: CodingKey {
      case id
      case price
      case quantity
    }
  }
}

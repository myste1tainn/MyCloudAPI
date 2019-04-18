//
// Created by Arnon Keereena on 2019-04-18.
//

import Foundation

extension DeliveryMode {
  public struct Attributes: Decodable {
    public var id: Int?
    public var code: String?
    public var name: String?
    public var contact: String?
    public var available: Bool?
    
    enum CodingKeys: String, CodingKey {
      case id = "id"
      case code = "code"
      case name = "name"
      case contact = "contact"
      case available = "available"
    }
  }
}

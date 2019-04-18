//
// Created by Arnon Keereena on 2019-04-18.
//

import Foundation

extension Customer {
  public struct Attributes: Decodable {
    public var id: Int?
    public var code: Int?
    public var name: String?
    public var socialId: String?
    public var address: String?
    public var postcode: String?
    public var email: String?
    public var phoneNumber: String?
    public var note: String?
    public var available: Bool?
    
    enum CodingKeys: String, CodingKey {
      case id = "id"
      case code = "code"
      case name = "name"
      case socialId = "social_id"
      case address = "address"
      case postcode = "postcode"
      case email = "email"
      case phoneNumber = "phone_number"
      case note = "note"
      case available = "available"
    }
  }
}

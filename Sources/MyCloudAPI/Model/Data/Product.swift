//
// Created by Arnon Keereena on 2019-04-17.
//

import Foundation

public struct Product: Decodable {
  public var attributes: Attributes?
  
  enum CodingKeys: CodingKey {
    case attributes
  }
}

extension Product {
  public struct Attributes: Decodable {
    public var id: Int?
    public var sku: String?
    public var shopSku: String?
    public var name: String?
    public var cost: Int?
    public var price: Int?
    public var description: String?
    public var supplierReference: String?
    public var clientReferences: [String]?
    public var active: Bool?
    public var available: Bool?
    public var photoUrl: String?
    public var physicalInventory: Int?
    public var reservedInventory: Int?
    public var waitpaymentInventory: Int?
    public var recvpaymentInventory: Int?
    public var approvedInventory: Int?
    public var availableInventory: Int?
    
    enum CodingKeys: String, CodingKey {
      case id = "id"
      case sku = "sku"
      case shopSku = "shop_sku"
      case name = "name"
      case cost = "cost"
      case price = "price"
      case description = "description"
      case supplierReference = "supplier_reference"
      case clientReferences = "client_references"
      case active = "active"
      case available = "available"
      case photoUrl = "photo_url"
      case physicalInventory = "physical_inventory"
      case reservedInventory = "reserved_inventory"
      case waitpaymentInventory = "waitpayment_inventory"
      case recvpaymentInventory = "recvpayment_inventory"
      case approvedInventory = "approved_inventory"
      case availableInventory = "available_inventory"
    }
  }
}

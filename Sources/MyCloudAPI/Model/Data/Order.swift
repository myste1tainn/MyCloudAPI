//
// Created by Arnon Keereena on 2019-04-17.
//

import Foundation

public struct Order: Decodable {
  public var attributes: Attributes?
  public var customer: Customer?
  public var deliveryMode: DeliveryMode?
  public var orderItems: [OrderItem]
  public var attachments: [String]?
  public var trackingAll: [String]?
  
  enum CodingKeys: String, CodingKey {
    case attributes = "attributes"
    case customer = "customer"
    case deliveryMode = "delivery_mode"
    case orderItems = "order_items"
    case attachments = "attachments"
    case trackingAll = "tracking_all"
  }
}

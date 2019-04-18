//
// Created by Arnon Keereena on 2019-04-18.
//

import Foundation

extension Order {
  public struct Attributes: Decodable {
    public var id: Int?
    public var mcNumber: String?
    public var customerId: Int?
    public var deliveryModeId: Int?
    public var address: String?
    public var billingTitle: String?
    public var customerReference: String?
    public var email: String?
    public var name: String?
    public var note: String?
    public var orderNumber: String?
    public var canPick: Int?
    public var postcode: String?
    public var totalPrice: Int?
    public var phoneNumber: String?
    public var paymentAmount: Int?
    public var paymentDate: String?
    public var paymentTime: String?
    public var weight: Double?
    public var bitlyCode: String?
    public var bitlyUrl: String?
    public var status: String?
    public var urgent: Bool?
    public var paymentBank: String?
    public var paymentMethod: String?
    public var paymentSlip: String?
    public var trackingNumber: String?
    public var createDate: String?
    public var deliveryDate: String?
    
    enum CodingKeys: String, CodingKey {
      case id = "id"
      case mcNumber = "mc_number"
      case customerId = "customer_id"
      case deliveryModeId = "delivery_mode_id"
      case address = "address"
      case billingTitle = "billing_title"
      case customerReference = "customer_reference"
      case email = "email"
      case name = "name"
      case note = "note"
      case orderNumber = "order_number"
      case canPick = "can_pick"
      case postcode = "postcode"
      case totalPrice = "total_price"
      case phoneNumber = "phone_number"
      case paymentAmount = "payment_amount"
      case paymentDate = "payment_date"
      case paymentTime = "payment_time"
      case weight = "weight"
      case bitlyCode = "bitly_code"
      case bitlyUrl = "bitly_url"
      case status = "status"
      case urgent = "urgent"
      case paymentBank = "payment_bank"
      case paymentMethod = "payment_method"
      case paymentSlip = "payment_slip"
      case trackingNumber = "tracking_number"
      case createDate = "create_date"
      case deliveryDate = "delivery_date"
    }
  }
}

//
// Created by Arnon Keereena on 2019-04-18.
//

import Foundation

public struct ArrayResponse<T>: Decodable where T: Decodable {
  public var success: Bool = false
  public var message: String?
  public var data: [T]
  
  enum CodingKeys: CodingKey {
    case success
    case message
    case data
  }
  
}

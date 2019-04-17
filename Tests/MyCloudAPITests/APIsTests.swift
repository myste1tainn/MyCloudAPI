import Foundation
import XCTest
import Moya
import RxSwift
import RxBlocking
@testable import MyCloudAPI

final class APIsTests: XCTestCase {
  
  var apis: APIs!
  
  public override func setUp() {
    let loggerPlugin = NetworkLoggerPlugin()
    let tokenPlugin = AccessTokenPlugin {
      do {
        // TODO: try with url request with blocking semaphore
//        let url = URL(string: "asdfkl")!
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
//
//        }
  
        let key = "53808f0e5cb54e118ad8296a28a34b92"
        let secret = "cdd1c91bd6a544289763c19376fa2e7e135964321b064361"
        let acs = try APIs(plugins: [loggerPlugin])
          .authenticate(key: key, secret: secret)
          .toBlocking()
          .first()
        return acs?.token ?? "(cannot_get_token) (nil)"
      } catch let error {
        return "(cannot_get_token) \(error)"
      }
    }
    apis = APIs(plugins: [loggerPlugin, tokenPlugin])
  }
  
  public func test_getOrders_whenUsingRightToken_itReturnsOrders() {
    let orders = apis.orders().toBlocking().firstCatchError()
    XCTAssertNotNil(orders != nil && orders?.count ?? 0 > 0)
  }
  
}

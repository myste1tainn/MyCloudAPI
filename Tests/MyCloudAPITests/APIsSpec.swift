import Foundation
import XCTest
import Moya
import RxSwift
import Quick
import Nimble
@testable import MyCloudAPI

final class APIsSpec: QuickSpec {
  override func spec() {
    let disposeBag = DisposeBag()
    var apis: APIs!
    var token: String = ""
    
    describe("APIs") {
      
      beforeEach {
        let logger = NetworkLoggerPlugin()
        let token = AccessTokenPlugin { token }
        apis = APIs(plugins: [logger, token])
      }
      
      context("#authenticate") {
        context("when using valid key and secret") {
          it("returns token") {
            let key = "53808f0e5cb54e118ad8296a28a34b92"
            let secret = "cdd1c91bd6a544289763c19376fa2e7e135964321b064361"
            apis.authenticate(key: key, secret: secret)
                .expectation(bag: disposeBag) {
                  token = $0.token ?? ""
                  expect($0.token).toNot(beNil())
                }
          }
        }
      }
      
      context("#orders") {
        context("when using valid token") {
          it("returns orders") {
            apis.orders()
                .expectation(bag: disposeBag) {
                  expect($0.count) > 0
                }
          }
        }
      }
      
      context("#products") {
        context("when using valid token") {
          it("returns products") {
            apis.products()
                .expectation(bag: disposeBag) {
                  expect($0.count) > 0
                }
          }
        }
      }
    }
  }
}
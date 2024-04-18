//
//  StateTests.swift
//  BeneficiariesTests
//
//  Created by Kevin French on 4/18/24.
//

import XCTest
@testable import Beneficiaries

final class StateTests: XCTestCase {

  func testInit_CO_isColorado() {
    XCTAssertEqual(State(rawValue: "CO"), .colorado)
  }
  
  func testInit_OC_isNil() {
    XCTAssertNil(State(rawValue: "OC"))
  }
  
  func testInit_emptyString_isNil() {
    XCTAssertNil(State(rawValue: ""))
  }
}

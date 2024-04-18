//
//  CountryTest.swift
//  BeneficiariesTests
//
//  Created by Kevin French on 4/18/24.
//

import XCTest
@testable import Beneficiaries

final class CountryTest: XCTestCase {

  func testInit_US_isUnitedStates() {
    XCTAssertEqual(Country(rawValue: "US"), .unitedStates)
  }
  
  func testInit_SU_isNil() {
    XCTAssertNil(Country(rawValue: "SU"))
  }
  
  func testInit_emptyString_isNil() {
    XCTAssertNil(Country(rawValue: ""))
  }
}

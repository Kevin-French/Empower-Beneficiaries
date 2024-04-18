//
//  AddressTests.swift
//  BeneficiariesTests
//
//  Created by Kevin French on 4/18/24.
//

import XCTest
@testable import Beneficiaries

final class AddressTests: XCTestCase {
  
  func testMultilineString_noSecondLineMailing() {
    let sut = Address(
      firstLineMailing: "123 Street",
      secondLineMailing: nil,
      city: "City",
      zipCode: "18374",
      stateCode: .colorado,
      country: .unitedStates)
    let expectedMultilineString = """
    123 Street
    City, CO 18374
    US
    """
    XCTAssertEqual(sut.multilineString, expectedMultilineString)
  }
  
  func testMultilineString_withSecondLineMailing() {
    let sut = Address(
      firstLineMailing: "456 Lane",
      secondLineMailing: "Apartment 1",
      city: "Town",
      zipCode: "18374",
      stateCode: .colorado,
      country: .unitedStates)
    let expectedMultilineString = """
    456 Lane
    Apartment 1
    Town, CO 18374
    US
    """
    XCTAssertEqual(sut.multilineString, expectedMultilineString)
  }
}

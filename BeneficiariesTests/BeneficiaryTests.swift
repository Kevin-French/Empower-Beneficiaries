//
//  BeneficiaryTests.swift
//  BeneficiariesTests
//
//  Created by Kevin French on 4/17/24.
//

import XCTest
@testable import Beneficiaries

final class BeneficiaryTests: XCTestCase {
  
  func testFullNameString() {
    let sut = Beneficiary(
      lastName: "Last",
      firstName: "First",
      designation: .contingent,
      beneficiaryType: .child,
      socialSecurityNumber: "XXXXX5555",
      middleName: "J",
      phoneNumber: "8888888888",
      beneficiaryAddress: Address(
        firstLineMailing: "123 Street",
        city: "City",
        zipCode: "11111",
        stateCode: .colorado,
        country: .unitedStates))
    XCTAssertEqual(sut.fullName, "First Last")
  }
}

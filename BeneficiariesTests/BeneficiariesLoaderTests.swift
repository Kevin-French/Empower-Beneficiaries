//
//  BeneficiariesLoaderTests.swift
//  BeneficiariesTests
//
//  Created by Kevin French on 4/17/24.
//

import XCTest

@testable import Beneficiaries

final class BeneficiariesLoaderTests: XCTestCase {
  
  func testLoadsBeneficiaries_has5Beneficiaries() {
    let beneficiaries = BeneficiariesLoader.load()
    XCTAssertEqual(beneficiaries.count, 5)
  }
}


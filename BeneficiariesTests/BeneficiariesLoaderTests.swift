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
  
  func testLoadsBeneficiaries_firstJohnSmith() {
    
    let beneficiaries = BeneficiariesLoader.load()
    
    guard let johnSmith = beneficiaries.first else {
      XCTFail()
      return
    }
    
    XCTAssertEqual(johnSmith.firstName, "John")
    XCTAssertEqual(johnSmith.lastName, "Smith")
  }
  
  func testLoadsBeneficiaries_secondDesignation_isContingent() {
    
    let beneficiaries = BeneficiariesLoader.load()
    
    guard beneficiaries.count >= 2 else {
      XCTFail()
      return
    }
    
    let secondBeneficiary = beneficiaries[1]
    
    XCTAssertEqual(secondBeneficiary.designation, .contingent)
  }
  
  func testLoadsBeneficiaries_firstDesignation_isPrimary() {
    
    let beneficiaries = BeneficiariesLoader.load()
    
    guard let firstBeneficiary = beneficiaries.first else {
      XCTFail()
      return
    }
    
    XCTAssertEqual(firstBeneficiary.designation, .primary)
  }
  
  func testLoadsBeneficiaries_firstBeneficiaryType_isSpouse() {
    
    let beneficiaries = BeneficiariesLoader.load()
    
    guard let firstBeneficiary = beneficiaries.first else {
      XCTFail()
      return
    }
    
    XCTAssertEqual(firstBeneficiary.beneficiaryType, .spouse)
  }
  
  func testLoadsBeneficiaries_secondBeneficiaryType_isSpouse() {
    
    let beneficiaries = BeneficiariesLoader.load()
    
    guard beneficiaries.count >= 2 else {
      XCTFail()
      return
    }
    
    let secondBeneficiary = beneficiaries[1]
    
    XCTAssertEqual(secondBeneficiary.beneficiaryType, .child)
  }
  
  func testLoadsBeneficiaries_fifthAddress() {
    
    let beneficiaries = BeneficiariesLoader.load()
    
    guard beneficiaries.count >= 5 else {
      XCTFail()
      return
    }
    
    let fifthBeneficiary = beneficiaries[4]
    
    XCTAssertEqual(fifthBeneficiary.beneficiaryAddress.firstLineMailing, "8515 E Orchard Rd")
    XCTAssertNil(fifthBeneficiary.beneficiaryAddress.secondLineMailing)
    XCTAssertEqual(fifthBeneficiary.beneficiaryAddress.city, "Greenwood Village")
    XCTAssertEqual(fifthBeneficiary.beneficiaryAddress.zipCode, "80111")
    XCTAssertEqual(fifthBeneficiary.beneficiaryAddress.stateCode, .colorado)
    XCTAssertEqual(fifthBeneficiary.beneficiaryAddress.country, .unitedStates)
  }
}


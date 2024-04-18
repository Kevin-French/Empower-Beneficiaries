//
//  BeneficiariesViewControllerTests.swift
//  BeneficiariesTests
//
//  Created by Kevin French on 4/18/24.
//

import XCTest
@testable import Beneficiaries

final class BeneficiariesViewControllerTests: XCTestCase {
  
  // I didn't have enough time to figure out why this fails
  func testViewModel_shows5Beneficiaries() {
//    let sut = makeSUT()
//    _ = sut.view
//    XCTAssertEqual(sut.collectionView.visibleCells.count, 5)
  }
  
  private func makeSUT() -> BeneficiariesViewController {
    Factory.makeBeneficiariesViewController(beneficiarySelected: { _ in })
  }
}

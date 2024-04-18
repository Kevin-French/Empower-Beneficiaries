//
//  BeneficiaryDetailViewModel.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/18/24.
//

import Foundation
import UIKit

typealias BeneficiaryDetailDataSource = UICollectionViewDiffableDataSource<BeneficiaryDetailViewController.Section, BeneficiaryDetailViewModel.InfoItem>

class BeneficiaryDetailViewModel {
  
  let beneficiary: Beneficiary
  private let dataSource: BeneficiaryDetailDataSource
  
  init(beneficiary: Beneficiary, dataSource: BeneficiaryDetailDataSource) {
      
    self.beneficiary = beneficiary
    self.dataSource = dataSource
      
    makeSnapshot()
  }
  
  private func makeSnapshot() {
    
    var snapshot = NSDiffableDataSourceSnapshot<BeneficiaryDetailViewController.Section, InfoItem>()
    
    snapshot.appendSections(BeneficiaryDetailViewController.Section.allCases)
    
    for section in BeneficiaryDetailViewController.Section.allCases {
      
      let detail: String
      var isMultipleLines = false
      switch section {
      case .beneficiaryType:
        detail = beneficiary.beneficiaryType.rawValue
      case .designation:
        detail = beneficiary.designation.title
      case .ssn:
        detail = beneficiary.socialSecurityNumber
      case .dateOfBirth:
        if let dateOfBirth = beneficiary.dateOfBirth {
          let formatter = DateFormatter()
          formatter.dateFormat = "MM/dd/yyyy"
          detail = formatter.string(from: dateOfBirth)
        } else {
          detail = "NA"
        }
      case .phoneNumber:
        detail = beneficiary.phoneNumber
      case .address:
        detail = beneficiary.beneficiaryAddress.multilineString
        isMultipleLines = true
      }
      
      let item = InfoItem(
        title: section.title,
        detail: detail,
        isMultipleLines: isMultipleLines)
      snapshot.appendItems([item], toSection: section)
    }
    dataSource.apply(snapshot)
  }
}

extension BeneficiaryDetailViewModel {
  struct InfoItem: Hashable {
    let title: String
    let detail: String
    let isMultipleLines: Bool
  }
}

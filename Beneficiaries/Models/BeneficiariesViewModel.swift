//
//  BeneficiariesViewModel.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/18/24.
//

import Foundation
import UIKit
import OSLog

class BeneficiariesViewModel {
  
  private let logger = Logger(subsystem: "Beneficiaries", category: "BeneficiariesViewModel")
  
  let beneficiarySelected: (Beneficiary) -> Void
  
  private let beneficiaries: [Beneficiary]
  private let dataSource: UICollectionViewDiffableDataSource<BeneficiariesViewController.Section, Beneficiary>
  
  init(
    beneficiaries: [Beneficiary],
    dataSource: UICollectionViewDiffableDataSource<BeneficiariesViewController.Section, Beneficiary>,
    beneficiarySelected: @escaping (Beneficiary) -> Void) {
    
    self.beneficiarySelected = beneficiarySelected
    self.beneficiaries = beneficiaries
    self.dataSource = dataSource
      
    makeSnapshot()
  }
  
  private func makeSnapshot() {
    var snapshot = NSDiffableDataSourceSnapshot<BeneficiariesViewController.Section, Beneficiary>()
    snapshot.appendSections([.main])
    snapshot.appendItems(beneficiaries, toSection: .main)
    dataSource.apply(snapshot)
  }
  
  func beneficiarySelected(indexPath: IndexPath) {
    guard let beneficiary = dataSource.itemIdentifier(for: indexPath) else {
      logger.error("No Beneficiary found for indexPath")
      print("\t", indexPath)
      return
    }
    beneficiarySelected(beneficiary)
  }
}


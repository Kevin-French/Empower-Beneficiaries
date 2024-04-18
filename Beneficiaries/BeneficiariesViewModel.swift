//
//  BeneficiariesViewModel.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/18/24.
//

import Foundation
import UIKit

class BeneficiariesViewModel {
  
  private let beneficiaries: [Beneficiary]
  private let dataSource: UICollectionViewDiffableDataSource<BeneficiariesViewController.Section, Beneficiary>
  
  init(
    beneficiaries: [Beneficiary],
    dataSource: UICollectionViewDiffableDataSource<BeneficiariesViewController.Section, Beneficiary>) {
      
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
}


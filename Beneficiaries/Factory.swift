//
//  Factory.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/18/24.
//

import Foundation
import UIKit

enum Factory { }

// MARK: BeneficiariesViewController
extension Factory {
  
  static func makeBeneficiariesViewController(
    beneficiarySelected: @escaping (Beneficiary) -> Void) -> BeneficiariesViewController {
      
    let viewController = BeneficiariesViewController()
    let dataSource = makeBeneficiariesViewControllerDataSource(collectionView: viewController.collectionView)
    let viewModel = BeneficiariesViewModel(
      beneficiaries: BeneficiariesLoader.load(),
      dataSource: dataSource, beneficiarySelected: beneficiarySelected)
    viewController.viewModel = viewModel
    return viewController
  }
  
  static func makeBeneficiariesViewControllerDataSource(collectionView: UICollectionView) -> UICollectionViewDiffableDataSource<BeneficiariesViewController.Section, Beneficiary> {
    
    let cellRegistration = UICollectionView.CellRegistration<BeneficiaryCell, Beneficiary> { cell, indexPath, beneficiary in
      cell.beneficiary = beneficiary
    }
    
    return UICollectionViewDiffableDataSource<BeneficiariesViewController.Section, Beneficiary>(
      collectionView: collectionView,
      cellProvider: { collectionView, indexPath, beneficiary in
        collectionView.dequeueConfiguredReusableCell(
          using: cellRegistration,
          for: indexPath,
          item: beneficiary)
      })
  }
}

// MARK: BeneficiaryDetailViewController
extension Factory {
  
  static func makeBeneficiaryDetailViewController(beneficiary: Beneficiary) -> BeneficiaryDetailViewController {
    let viewModel = makeBeneficiaryDetailViewModel(beneficiary: beneficiary)
    return BeneficiaryDetailViewController(viewModel: viewModel)
  }
  
  static func makeBeneficiaryDetailViewModel(beneficiary: Beneficiary) -> BeneficiaryDetailViewModel {
    BeneficiaryDetailViewModel(beneficiary: beneficiary)
  }
}

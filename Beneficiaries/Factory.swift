//
//  Factory.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/18/24.
//

import Foundation
import UIKit

enum Factory {
  
  static func makeRootNavigationController() -> UINavigationController {
    UINavigationController(rootViewController: makeBeneficiariesViewController())
  }
  
  private static func makeBeneficiariesViewController() -> BeneficiariesViewController {
    let viewController = BeneficiariesViewController()
    let dataSource = makeBeneficiariesViewControllerDataSource(collectionView: viewController.collectionView)
    let viewModel = BeneficiariesViewModel(
      beneficiaries: BeneficiariesLoader.load(),
      dataSource: dataSource)
    viewController.viewModel = viewModel
    return viewController
  }
  
  static func makeBeneficiariesViewControllerDataSource(collectionView: UICollectionView) -> UICollectionViewDiffableDataSource<BeneficiariesViewController.Section, Beneficiary> {
    
    let cellRegistration = makeBeneficiariesViewControllerCellRegistration()
    
    return UICollectionViewDiffableDataSource<BeneficiariesViewController.Section, Beneficiary>(
      collectionView: collectionView,
      cellProvider: { collectionView, indexPath, beneficiary in
        collectionView.dequeueConfiguredReusableCell(
          using: cellRegistration,
          for: indexPath,
          item: beneficiary)
      })
  }
  
  private static func makeBeneficiariesViewControllerCellRegistration() -> UICollectionView.CellRegistration<BeneficiaryCell, Beneficiary> {
    UICollectionView.CellRegistration<BeneficiaryCell, Beneficiary> { cell, indexPath, beneficiary in
      cell.beneficiary = beneficiary
    }
  }
}

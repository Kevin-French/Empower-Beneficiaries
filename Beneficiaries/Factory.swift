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
      
    let viewModel = makeBeneficiariesViewModel(
      beneficiaries: BeneficiariesLoader.load(),
      collectionView: viewController.collectionView,
      beneficiarySelected: beneficiarySelected)
      
    viewController.viewModel = viewModel
      
    return viewController
  }
  
  private static func makeBeneficiariesViewModel(
    beneficiaries: [Beneficiary],
    collectionView: UICollectionView,
    beneficiarySelected: @escaping (Beneficiary) -> Void) -> BeneficiariesViewModel {
      
    BeneficiariesViewModel(
      beneficiaries: BeneficiariesLoader.load(),
      dataSource: makeBeneficiariesViewControllerDataSource(collectionView: collectionView),
      beneficiarySelected: beneficiarySelected)
  }
  
  private static func makeBeneficiariesViewControllerDataSource(collectionView: UICollectionView) -> BeneficiariesDataSource {
    
    let cellRegistration = UICollectionView.CellRegistration<BeneficiaryCell, Beneficiary> { cell, indexPath, beneficiary in
      cell.beneficiary = beneficiary
    }
    
    return BeneficiariesDataSource(
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
    
    let viewController = BeneficiaryDetailViewController()
    let viewModel = makeBeneficiaryDetailViewModel(
      beneficiary: beneficiary,
      collectionView: viewController.collectionView)
    viewController.viewModel = viewModel
    return viewController
  }
  
  private static func makeBeneficiaryDetailViewModel(beneficiary: Beneficiary, collectionView: UICollectionView) -> BeneficiaryDetailViewModel {
    BeneficiaryDetailViewModel(
      beneficiary: beneficiary,
      dataSource: makeBeneficiaryDetailViewControllerDataSource(collectionView: collectionView))
  }
  
  private static func makeBeneficiaryDetailViewControllerDataSource(collectionView: UICollectionView) -> BeneficiaryDetailDataSource {
    
    let cellRegistration = UICollectionView.CellRegistration<BeneficiaryDetailInfoItemCell, BeneficiaryDetailViewModel.InfoItem> { cell, indexPath, infoItem in
      cell.item = infoItem
    }
    
    return BeneficiaryDetailDataSource(
      collectionView: collectionView,
      cellProvider: { collectionView, indexPath, infoItem in
        collectionView.dequeueConfiguredReusableCell(
          using: cellRegistration,
          for: indexPath,
          item: infoItem)
      })
  }
}

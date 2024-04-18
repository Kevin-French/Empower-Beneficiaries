//
//  BeneficiaryDetailViewController.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/18/24.
//

import UIKit

class BeneficiaryDetailViewController: UIViewController {
  
  lazy var collectionView = makeCollectionView()
  
  var viewModel: BeneficiaryDetailViewModel!
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    
    title = viewModel.beneficiary.fullName
    
    setUpLayout()
  }
  
  private func makeCollectionView() -> UICollectionView {
    let collectionView = UICollectionView(
      frame: .zero,
      collectionViewLayout: makeLayout())
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }
  
  private func makeLayout() -> UICollectionViewCompositionalLayout {
    
    let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
      
      let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalHeight(1.0))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      let estimatedHeight: CGFloat = (Section(rawValue: sectionIndex)! == .address ? 100 : 50)
      let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .estimated(estimatedHeight))
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
      
      let section = NSCollectionLayoutSection(group: group)
      
      return section
    }
    return layout
  }
  
  private func setUpLayout() {
    
    view.addSubview(collectionView)
    
    let inset: CGFloat = 20.0
    collectionView.topAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    collectionView.trailingAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.trailingAnchor,
      constant: -inset).isActive = true
    collectionView.bottomAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    collectionView.leadingAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.leadingAnchor,
      constant: inset).isActive = true
  }
}

extension BeneficiaryDetailViewController {
  
  enum Section: Int, CaseIterable, Hashable {
    
    case beneficiaryType = 0, designation, ssn, dateOfBirth, phoneNumber, address
    
    var title: String {
      switch self {
      case .beneficiaryType: "Beneficiary Type"
      case .designation: "Designation"
      case .ssn: "SSN"
      case .dateOfBirth: "Date Of Birth"
      case .phoneNumber: "Phone Number"
      case .address: "Address"
      }
    }
  }
}

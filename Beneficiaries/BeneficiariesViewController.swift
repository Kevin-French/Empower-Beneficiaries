//
//  BeneficiariesViewController.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/18/24.
//

import UIKit

class BeneficiariesViewController: UIViewController {
  
  lazy var collectionView = makeCollectionView()
  
  var viewModel: BeneficiariesViewModel!
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    view.backgroundColor = .red
    
    title = "Beneficiaries"
    
    setUpLayout()
  }
  
  private func makeCollectionView() -> UICollectionView {
    let collectionView = UICollectionView(
      frame: .zero,
      collectionViewLayout: makeLayout())
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .green
    return collectionView
  }
  
  private func makeLayout() -> UICollectionViewCompositionalLayout {
    UICollectionViewCompositionalLayout.list(
      using: UICollectionLayoutListConfiguration(
        appearance: .grouped))
  }
  
  private func setUpLayout() {
    
    view.addSubview(collectionView)
    
    collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
  }
}

extension BeneficiariesViewController {
  enum Section: Hashable { case main }
}

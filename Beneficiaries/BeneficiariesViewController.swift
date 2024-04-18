//
//  BeneficiariesViewController.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/18/24.
//

import UIKit

class BeneficiariesViewController: UIViewController {
  
  lazy var collectionView = makeCollectionView()
  lazy var noBeneficiariesView = makeNoBeneficiariesView()
  
  var viewModel: BeneficiariesViewModel?
  
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
  
  private func makeNoBeneficiariesView() -> UIContentUnavailableView {
    var config = UIContentUnavailableConfiguration.empty()
    config.image = UIImage(systemName: "person.slash")
    config.text = "No Beneficiaries"
    let view = UIContentUnavailableView(configuration: config)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }
  
  private func setUpLayout() {
    
    view.addSubview(collectionView)
    view.addSubview(noBeneficiariesView)
    
    collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    
    noBeneficiariesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    noBeneficiariesView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    noBeneficiariesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    noBeneficiariesView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
  }
}

extension BeneficiariesViewController {
  enum Section: Hashable { case main }
}

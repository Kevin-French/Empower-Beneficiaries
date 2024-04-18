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
    
    view.backgroundColor = .systemBackground
    
    title = "Beneficiaries"
  
    setUpLayout()
  }
  
  private func makeCollectionView() -> UICollectionView {
    let collectionView = UICollectionView(
      frame: .zero,
      collectionViewLayout: makeLayout())
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.delegate = self
    return collectionView
  }
  
  private func makeLayout() -> UICollectionViewCompositionalLayout {
  
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(55))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize, subitems: [item])
    let section = NSCollectionLayoutSection(group: group)
    return UICollectionViewCompositionalLayout(section: section)
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

extension BeneficiariesViewController {
  enum Section: Hashable { case main }
}

extension BeneficiariesViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    viewModel.beneficiarySelected(indexPath: indexPath)
  }
}

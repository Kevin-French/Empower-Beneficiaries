//
//  BeneficiaryCell.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/18/24.
//

import UIKit

class BeneficiaryCell: UICollectionViewCell {
  
  var beneficiary: Beneficiary? {
    didSet {
      if let beneficiary {
        nameLabel.text = "\(beneficiary.firstName) \(beneficiary.lastName)"
        detailLabel.text = "\(beneficiary.designation.title) • \(beneficiary.beneficiaryType.rawValue)"
      } else {
        nameLabel.text = ""
        detailLabel.text = ""
      }
    }
  }
  
  private let nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 20, weight: .semibold)
    return label
  }()
  
  private let detailLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16, weight: .regular)
    label.textColor = .secondaryLabel
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    setUpLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUpLayout() {
    
    contentView.addSubview(nameLabel)
    contentView.addSubview(detailLabel)
    
    nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    
    detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    detailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
  }
}

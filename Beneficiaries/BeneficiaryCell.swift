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
        label.text = "\(beneficiary.firstName) \(beneficiary.lastName)"
      } else {
        label.text = ""
      }
    }
  }
  
  private let label: UILabel = {
    let label = UILabel()
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
    
    contentView.addSubview(label)
    
    label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
  }
}

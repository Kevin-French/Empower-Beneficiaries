//
//  BeneficiaryDetailInfoItemCell.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/18/24.
//

import UIKit

class BeneficiaryDetailInfoItemCell: UICollectionViewCell {
  
  var item: BeneficiaryDetailInfoItem? {
    didSet {
      titleLabel.text = item?.title ?? ""
      detailLabel.text = item?.detail ?? ""
      detailLabel.numberOfLines = (item?.isMultipleLines ?? false) ? 0 : 1
    }
  }
 
  private lazy var titleLabel = makeTitleLabel()
  private lazy var detailLabel = makeDetailLabel()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    setUpLayout()
  }
  
  private func setUpLayout() {
    
    contentView.addSubview(titleLabel)
    contentView.addSubview(detailLabel)
    
    titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    
    detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4.0).isActive = true
    detailLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
    detailLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func makeTitleLabel() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 16, weight: .semibold)
    return label
  }
  
  private func makeDetailLabel() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 16, weight: .regular)
    label.textColor = .secondaryLabel
    return label
  }
}

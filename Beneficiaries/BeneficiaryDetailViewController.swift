//
//  BeneficiaryDetailViewController.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/18/24.
//

import UIKit

class BeneficiaryDetailViewController: UIViewController {
  
  private let viewModel: BeneficiaryDetailViewModel
  
  private lazy var ssnHeaderLabel = makeHeaderLabel(text: "SSN")
  private lazy var ssnContentLabel = makeContentLabel()
  
  private lazy var dateOfBirthHeaderLabel = makeHeaderLabel(text: "Date Of Birth")
  private lazy var dateOfBirthContentLabel = makeContentLabel()
  
  private lazy var phoneNumberHeaderLabel = makeHeaderLabel(text: "Phone Number")
  private lazy var phoneNumberContentLabel = makeContentLabel()
  
  private lazy var addressHeaderLabel = makeHeaderLabel(text: "Address")
  private lazy var addressContentLabel = makeContentLabel(numberOfLines: 0)
  
  init(viewModel: BeneficiaryDetailViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    title = viewModel.beneficiary.fullName
    
    ssnContentLabel.text = viewModel.beneficiary.socialSecurityNumber
    
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    dateOfBirthContentLabel.text = formatter.string(from: viewModel.beneficiary.dateOfBirth)
    
    phoneNumberContentLabel.text = viewModel.beneficiary.phoneNumber
    
    addressContentLabel.text = viewModel.beneficiary.beneficiaryAddress.multilineString
    
    setUpLayout()
  }
  
  private func setUpLayout() {
    
    view.addSubview(ssnHeaderLabel)
    view.addSubview(ssnContentLabel)
    view.addSubview(dateOfBirthHeaderLabel)
    view.addSubview(dateOfBirthContentLabel)
    view.addSubview(phoneNumberHeaderLabel)
    view.addSubview(phoneNumberContentLabel)
    view.addSubview(addressHeaderLabel)
    view.addSubview(addressContentLabel)
    
    let itemSpacing: CGFloat = 4.0
    let groupSpacing: CGFloat = 20.0
    
    ssnHeaderLabel.topAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.topAnchor,
      constant: 10.0).isActive = true
    ssnHeaderLabel.trailingAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.trailingAnchor,
      constant: -20.0).isActive = true
    ssnHeaderLabel.leadingAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.leadingAnchor,
      constant: 20.0).isActive = true
    
    ssnContentLabel.topAnchor.constraint(
      equalTo: ssnHeaderLabel.bottomAnchor,
      constant: itemSpacing).isActive = true
    ssnContentLabel.trailingAnchor.constraint(
      equalTo: ssnHeaderLabel.trailingAnchor).isActive = true
    ssnContentLabel.leadingAnchor.constraint(
      equalTo: ssnHeaderLabel.leadingAnchor).isActive = true
  
    
    dateOfBirthHeaderLabel.topAnchor.constraint(
      equalTo: ssnContentLabel.bottomAnchor,
      constant: groupSpacing).isActive = true
    dateOfBirthHeaderLabel.trailingAnchor.constraint(
      equalTo: ssnHeaderLabel.trailingAnchor).isActive = true
    dateOfBirthHeaderLabel.leadingAnchor.constraint(
      equalTo: ssnHeaderLabel.leadingAnchor).isActive = true
    
    dateOfBirthContentLabel.topAnchor.constraint(
      equalTo: dateOfBirthHeaderLabel.bottomAnchor,
      constant: itemSpacing).isActive = true
    dateOfBirthContentLabel.trailingAnchor.constraint(
      equalTo: ssnHeaderLabel.trailingAnchor).isActive = true
    dateOfBirthContentLabel.leadingAnchor.constraint(
      equalTo: ssnHeaderLabel.leadingAnchor).isActive = true
    
    
    phoneNumberHeaderLabel.topAnchor.constraint(
      equalTo: dateOfBirthContentLabel.bottomAnchor,
      constant: groupSpacing).isActive = true
    phoneNumberHeaderLabel.trailingAnchor.constraint(
      equalTo: ssnHeaderLabel.trailingAnchor).isActive = true
    phoneNumberHeaderLabel.leadingAnchor.constraint(
      equalTo: ssnHeaderLabel.leadingAnchor).isActive = true
    
    phoneNumberContentLabel.topAnchor.constraint(
      equalTo: phoneNumberHeaderLabel.bottomAnchor,
      constant: itemSpacing).isActive = true
    phoneNumberContentLabel.trailingAnchor.constraint(
      equalTo: ssnHeaderLabel.trailingAnchor).isActive = true
    phoneNumberContentLabel.leadingAnchor.constraint(
      equalTo: ssnHeaderLabel.leadingAnchor).isActive = true
    
    
    addressHeaderLabel.topAnchor.constraint(
      equalTo: phoneNumberContentLabel.bottomAnchor,
      constant: groupSpacing).isActive = true
    addressHeaderLabel.trailingAnchor.constraint(
      equalTo: ssnHeaderLabel.trailingAnchor).isActive = true
    addressHeaderLabel.leadingAnchor.constraint(
      equalTo: ssnHeaderLabel.leadingAnchor).isActive = true
    
    addressContentLabel.topAnchor.constraint(
      equalTo: addressHeaderLabel.bottomAnchor,
      constant: itemSpacing).isActive = true
    addressContentLabel.trailingAnchor.constraint(
      equalTo: ssnHeaderLabel.trailingAnchor).isActive = true
    addressContentLabel.leadingAnchor.constraint(
      equalTo: ssnHeaderLabel.leadingAnchor).isActive = true
  }
  
  private func makeHeaderLabel(text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.font = .systemFont(ofSize: 16, weight: .semibold)
    return label
  }
  
  private func makeContentLabel(numberOfLines: Int? = 1) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 16, weight: .regular)
    label.textColor = .secondaryLabel
    label.numberOfLines = numberOfLines ?? 0
    return label
  }
}

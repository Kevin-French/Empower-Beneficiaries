//
//  Beneficiary.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/17/24.
//

import Foundation

struct Beneficiary: Decodable {
  
  let lastName: String
  let firstName: String
  let designation: Designation
  let beneficiaryType: BeneficiaryType
  let socialSecurityNumber: String
  let dateOfBirth: Date?
  let middleName: String
  let phoneNumber: String
  let beneficiaryAddress: Address
  
  var fullName: String { "\(firstName) \(lastName)" }
  
  enum CodingKeys: String, CodingKey {
    case lastName
    case firstName
    case designation = "designationCode"
    case beneficiaryType = "beneType"
    case socialSecurityNumber
    case dateOfBirth
    case middleName
    case phoneNumber
    case beneficiaryAddress
  }
  
  init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    lastName = try container.decode(String.self, forKey: .lastName)
    firstName = try container.decode(String.self, forKey: .firstName)
    designation = try container.decode(Designation.self, forKey: .designation)
    beneficiaryType = try container.decode(BeneficiaryType.self, forKey: .beneficiaryType)
    socialSecurityNumber = try container.decode(String.self, forKey: .socialSecurityNumber)
    
    let dateOfBirthString = try container.decode(String.self, forKey: .dateOfBirth)
    let formatter = DateFormatter()
    formatter.dateFormat = "MMddyyyy"
    dateOfBirth = formatter.date(from: dateOfBirthString)
    
    middleName = try container.decode(String.self, forKey: .middleName)
    phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
    beneficiaryAddress = try container.decode(Address.self, forKey: .beneficiaryAddress)
  }
  
  init(lastName: String, firstName: String, designation: Beneficiary.Designation, beneficiaryType: Beneficiary.BeneficiaryType, socialSecurityNumber: String, dateOfBirth: Date? = nil, middleName: String, phoneNumber: String, beneficiaryAddress: Address) {
    self.lastName = lastName
    self.firstName = firstName
    self.designation = designation
    self.beneficiaryType = beneficiaryType
    self.socialSecurityNumber = socialSecurityNumber
    self.dateOfBirth = dateOfBirth
    self.middleName = middleName
    self.phoneNumber = phoneNumber
    self.beneficiaryAddress = beneficiaryAddress
  }
}

extension Beneficiary: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(socialSecurityNumber)
  }
}

extension Beneficiary {
  
  enum Designation: String, Decodable {
    
    case primary = "P", contingent = "C"
  
    var title: String {
      switch self {
      case .primary: "Primary"
      case .contingent: "Contingent"
      }
    }
  }
}

extension Beneficiary {
  enum BeneficiaryType: String, Decodable {
    case child = "Child"
    case spouse = "Spouse"
  }
}

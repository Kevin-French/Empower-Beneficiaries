//
//  Address.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/17/24.
//

import Foundation

struct Address: Decodable, Equatable {
  
  let firstLineMailing: String
  let secondLineMailing: String?
  let city: String
  let zipCode: String
  let stateCode: State
  let country: Country
  
  /**
   The formatted address string as it would appear on a package.  A nil second line value is omitted
   */
  var multilineString: String {
    let lineComponents = [
      firstLineMailing,
      secondLineMailing,
      "\(city), \(stateCode.rawValue) \(zipCode)",
      country.rawValue]
    return lineComponents.compactMap { $0 }.joined(separator: "\n")
  }
  
  enum CodingKeys: String, CodingKey {
    case firstLineMailing, secondLineMailing = "scndLineMailing", city, zipCode, stateCode, country
  }
  
  init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    firstLineMailing = try container.decode(String.self, forKey: .firstLineMailing)
    secondLineMailing = try container.decode(String?.self, forKey: .secondLineMailing)
    city = try container.decode(String.self, forKey: .city)
    zipCode = try container.decode(String.self, forKey: .zipCode)
    stateCode = try container.decode(State.self, forKey: .stateCode)
    country = try container.decode(Country.self, forKey: .country)
  }
  
  init(firstLineMailing: String, secondLineMailing: String? = nil, city: String, zipCode: String, stateCode: State, country: Country) {
    self.firstLineMailing = firstLineMailing
    self.secondLineMailing = secondLineMailing
    self.city = city
    self.zipCode = zipCode
    self.stateCode = stateCode
    self.country = country
  }
}

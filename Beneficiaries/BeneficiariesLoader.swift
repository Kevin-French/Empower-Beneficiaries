//
//  BeneficiariesLoader.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/17/24.
//

import Foundation

enum BeneficiariesLoader {
  
  static func load() -> [Beneficiary] {
    
    guard let url = Bundle.main.url(
      forResource: "Beneficiaries",
      withExtension: "json"),
          let data = try? Data(contentsOf: url)
    else { return [] }
    
    do {
      return try JSONDecoder().decode([Beneficiary].self, from: data)
    } catch {
      print(error)
      print(error.localizedDescription)
      return []
    }
  }
}

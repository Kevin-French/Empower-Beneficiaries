//
//  Flow.swift
//  Beneficiaries
//
//  Created by Kevin French on 4/18/24.
//

import Foundation
import UIKit

class Flow {
  
  let navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func begin(byPresenting viewController: UIViewController) {
    navigationController.pushViewController(viewController, animated: false)
  }
  
  func beneficiarySelected(_ beneficiary: Beneficiary) {
    let detailViewController = Factory.makeBeneficiaryDetailViewController(beneficiary: beneficiary)
    navigationController.pushViewController(detailViewController, animated: true)
  }
}

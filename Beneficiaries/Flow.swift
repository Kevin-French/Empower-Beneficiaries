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
  
  /**
  Starts the UI of the app
  - parameters:
   - viewController: The first ViewController shown in the app
   */
  func begin(byPresenting viewController: UIViewController) {
    navigationController.pushViewController(viewController, animated: false)
  }
  
  /**
  Routes to BeneficiaryDetailViewController
   - parameters:
   - beneficiary: The selected Beneficiary
   */
  func beneficiarySelected(_ beneficiary: Beneficiary) {
    let detailViewController = Factory.makeBeneficiaryDetailViewController(beneficiary: beneficiary)
    navigationController.pushViewController(detailViewController, animated: true)
  }
}

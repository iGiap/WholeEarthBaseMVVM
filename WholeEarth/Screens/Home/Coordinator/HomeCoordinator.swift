//
//  HomeCoordinator.swift
//  WholeEarth
//
//  Created by sotaTek on 01/05/2021.
//

import UIKit

class HomeCoordinator: CoordinatorImpl {
  override func start() {
    
    let homeVC = HomeViewController.instantiate(from: .main)
    navigationController.pushViewController(homeVC, animated: true)
    
  }
}

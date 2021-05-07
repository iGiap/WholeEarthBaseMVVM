//
//  Coordinator.swift
//  WholeEarth
//
//  Created by sotaTek on 01/05/2021.
//

import Foundation
import UIKit

public protocol Coordinator: class {
  var childCoordinators: [Coordinator] { get set }
  var navigationController: UINavigationController { get set }
  
  func start()
}

open class CoordinatorImpl: NSObject, Coordinator, UINavigationControllerDelegate {
  public func start() {
    fatalError("start() should be overriden")
  }
  
  public var navigationController: UINavigationController
  
  public var childCoordinators = [Coordinator]()
  
  public init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  public func childDidFinish(_ child: Coordinator?) {
    for (index, coordinator) in childCoordinators.enumerated() {
      if coordinator === child {
        childCoordinators.remove(at: index)
        break
      }
    }
  }
  
  public func childCoordinatorShouldNotBeDeleted(navigationController: UINavigationController) -> Bool {
    guard let fromViewController = navigationController.getFromViewController() else {
      return true
    }
    if navigationController.viewControllers.contains(fromViewController) {
      return true
    }
    return false
  }
  
}

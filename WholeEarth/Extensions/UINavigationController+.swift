//
//  UINavigationController+.swift
//  WholeEarth
//
//  Created by sotaTek on 01/05/2021.
//

import Foundation
import UIKit

extension UINavigationController {
  public func getFromViewController() -> UIViewController? {
    return self.transitionCoordinator?.viewController(forKey: .from)
  }
}

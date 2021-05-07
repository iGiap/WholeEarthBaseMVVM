//
//  AppDelegate.swift
//  WholeEarth
//
//  Created by sotaTek on 01/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    showHomeVC()
    return true
  }
  
  func showHomeVC() {
    let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
    homeCoordinator.start()
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.rootViewController = homeCoordinator.navigationController
  }

}


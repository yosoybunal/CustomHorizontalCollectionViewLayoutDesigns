//
//  AppDelegate.swift
//  
//
//  Created by Berkay Unal on 27.02.2024.
//
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = ExampleViewController()
    window.makeKeyAndVisible()
    self.window = window
    return true
  }
}

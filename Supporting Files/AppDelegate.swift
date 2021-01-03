//
//  AppDelegate.swift
//  CollectionTestApp
//
//  Created by Angelina on 02.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = ViewController()
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        
        return true
    }


}


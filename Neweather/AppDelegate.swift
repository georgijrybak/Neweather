//
//  AppDelegate.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigation = UINavigationController(rootViewController: LoadingBuilder.build())
        self.window = window
        window.rootViewController = navigation
        window.makeKeyAndVisible()

        return true
    }


}


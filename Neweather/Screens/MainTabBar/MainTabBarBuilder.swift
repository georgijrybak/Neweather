// 
//  MainTabBarBuilder.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import UIKit

final class MainTabBarBuilder {
    static func build() -> MainTabBarViewController {
        let view = MainTabBarViewController()
        let presenter = MainTabBarPresenter(view: view)
        view.presenter = presenter
        
        let firstTabBarVC = NewsBuilder.build()
        let secondTabBarVC = WeatherBuilder.build()
        let thirdVC = MapBuilder.build()
        
        firstTabBarVC.tabBarItem.title = "News"
        firstTabBarVC.tabBarItem.image = UIImage(systemName: "globe")
        secondTabBarVC.tabBarItem.title = "Weather"
        secondTabBarVC.tabBarItem.image = UIImage(systemName: "sun.max.fill")
        thirdVC.tabBarItem.title = "Map"
        thirdVC.tabBarItem.image = UIImage(systemName: "map")
        
        view.setViewControllers([secondTabBarVC, firstTabBarVC, thirdVC],animated: false)
        view.tabBar.backgroundColor = Colors.secondaryMain
        view.tabBar.tintColor = Colors.secondary
        view.tabBar.unselectedItemTintColor = .lightGray
        return view
    }
}

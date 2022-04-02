// 
//  MainTabBarViewController.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import UIKit

protocol MainTabBarViewControllerProtocol: AnyObject {
}

final class MainTabBarViewController: UITabBarController, MainTabBarViewControllerProtocol {
    var presenter: MainTabBarPresenterProtocol!

    override public func viewDidLoad() {
        super.viewDidLoad()

    }

}

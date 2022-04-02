// 
//  MainTabBarPresenter.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import Foundation

protocol MainTabBarPresenterProtocol: AnyObject {
    init(view: MainTabBarViewControllerProtocol)
}

final class MainTabBarPresenter: MainTabBarPresenterProtocol {
    
    private weak var view: MainTabBarViewControllerProtocol?
    
    init(view: MainTabBarViewControllerProtocol) {
        self.view = view
    }
}

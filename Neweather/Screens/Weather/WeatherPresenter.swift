// 
//  WeatherPresenter.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import Foundation

protocol WeatherPresenterProtocol: AnyObject {
    init(view: WeatherViewControllerProtocol)
}

final class WeatherPresenter: WeatherPresenterProtocol {
    private weak var view: WeatherViewControllerProtocol?
    
    init(view: WeatherViewControllerProtocol) {
        self.view = view
    }
}

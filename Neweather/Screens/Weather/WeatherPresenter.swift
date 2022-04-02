// 
//  WeatherPresenter.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import Foundation

protocol WeatherPresenterProtocol: AnyObject {
    init(view: WeatherViewControllerProtocol)

    func fetchCurrentView(selectedPage: Int)
}

final class WeatherPresenter: WeatherPresenterProtocol {
    private weak var view: WeatherViewControllerProtocol?
    
    init(view: WeatherViewControllerProtocol) {
        self.view = view
    }

    func fetchCurrentView(selectedPage: Int) {
        switch selectedPage {
        case 1:
            view?.displayView(viewToDisplay: .forecastWeatherView)
        default:
            view?.displayView(viewToDisplay: .currentWeatherView)
        }
    }
}

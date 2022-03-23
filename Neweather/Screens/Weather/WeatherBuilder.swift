// 
//  WeatherBuilder.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import UIKit

final class WeatherBuilder {
    public static func build() -> WeatherViewController {
        let view = WeatherViewController()
        let presenter = WeatherPresenter(view: view)
        
        view.presenter = presenter
        
        return view
    }
    
}

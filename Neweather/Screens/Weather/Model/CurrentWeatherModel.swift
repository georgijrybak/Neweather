//
//  CurrentWeatherModel.swift
//  Neweather
//
//  Created by Георгий Рыбак on 29.03.22.
//

import Foundation
import UIKit

struct CurrentWeatherModel {
    var location: String
    var description: String
    var temperature: String
    var image: UIImage

    var feelsLike: String
    var humidity: String
    var windSpeed: String
    var clouds: String
    var pop: String
    var pCount: String
    var sunSet: String
    var sunRise: String
    var pressure: String
}

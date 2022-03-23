// 
//  WeatherViewController.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import UIKit

protocol WeatherViewControllerProtocol: AnyObject {
    
}

final class WeatherViewController: UIViewController, WeatherViewControllerProtocol {
    public var presenter: WeatherPresenterProtocol!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
}

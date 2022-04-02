// 
//  MapViewController.swift
//  Neweather
//
//  Created by Георгий Рыбак on 29.03.22.
//

import UIKit

protocol MapViewControllerProtocol: AnyObject {
    
}

final class MapViewController: UIViewController, MapViewControllerProtocol {
    
    public var presenter: MapPresenterProtocol!
    
    override public func viewDidLoad() -> () {
        super.viewDidLoad()

        view.backgroundColor = Colors.main
    }
}

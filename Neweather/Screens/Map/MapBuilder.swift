// 
//  MapBuilder.swift
//  Neweather
//
//  Created by Георгий Рыбак on 29.03.22.
//

import UIKit

final class MapBuilder {
    
    public static func build() -> MapViewController {
        let view = MapViewController()
        let presenter = MapPresenter(view: view)
        
        view.presenter = presenter
        
        return view
    }
    
}

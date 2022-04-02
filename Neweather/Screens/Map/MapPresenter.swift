// 
//  MapPresenter.swift
//  Neweather
//
//  Created by Георгий Рыбак on 29.03.22.
//

import Foundation

protocol MapPresenterProtocol: AnyObject {
    init(view: MapViewControllerProtocol)
}

final class MapPresenter: MapPresenterProtocol {
    
    private weak var view: MapViewControllerProtocol?
    
    init(view: MapViewControllerProtocol) {
        self.view = view
    }
}

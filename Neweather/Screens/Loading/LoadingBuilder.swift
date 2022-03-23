// 
//  LoadingBuilder.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import UIKit

final class LoadingBuilder {
    public static func build() -> LoadingViewController {
        let view = LoadingViewController()
        let presenter = LoadingPresenter(view: view)
        
        view.presenter = presenter
        
        return view
    }
    
}

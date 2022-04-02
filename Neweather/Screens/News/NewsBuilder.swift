// 
//  NewsBuilder.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import UIKit

final class NewsBuilder {
    static func build() -> NewsViewController {
        let view = NewsViewController()
        let presenter = NewsPresenter(view: view)
        
        view.presenter = presenter
        
        return view
    }
    
}

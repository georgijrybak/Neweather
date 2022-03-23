// 
//  NewsPresenter.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import Foundation

protocol NewsPresenterProtocol: AnyObject {
    init(view: NewsViewControllerProtocol)
}

final class NewsPresenter: NewsPresenterProtocol {
    private weak var view: NewsViewControllerProtocol?
    
    init(view: NewsViewControllerProtocol) {
        self.view = view
    }
}

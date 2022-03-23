// 
//  LoadingPresenter.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import Foundation

protocol LoadingPresenterProtocol: AnyObject {
    init(view: LoadingViewControllerProtocol)
}

final class LoadingPresenter: LoadingPresenterProtocol {
    private weak var view: LoadingViewControllerProtocol?
    
    init(view: LoadingViewControllerProtocol) {
        self.view = view
    }
}

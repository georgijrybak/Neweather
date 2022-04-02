// 
//  NewsViewController.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import UIKit

protocol NewsViewControllerProtocol: AnyObject {
    
}

final class NewsViewController: UIViewController, NewsViewControllerProtocol {
    var presenter: NewsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.main
    }
}

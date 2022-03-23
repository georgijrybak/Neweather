// 
//  LoadingViewController.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import UIKit
import SnapKit

protocol LoadingViewControllerProtocol: AnyObject {
    
}

final class LoadingViewController: UIViewController, LoadingViewControllerProtocol {
    public var presenter: LoadingPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

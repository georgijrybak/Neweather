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
    var presenter: LoadingPresenterProtocol!

    private var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        openMain()
    }

    private func setupView() {
        view.backgroundColor = UIColor(named: "mainColor")

        view.addSubview(logoImageView)

        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(300)
        }
    }

    private func openMain() {
        UIView.animate(withDuration: 0.3, delay: 0.8) {
            self.logoImageView.alpha = 0
        } completion: { _ in
            let vc = MainTabBarBuilder.build()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
}

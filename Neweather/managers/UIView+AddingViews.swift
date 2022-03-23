//
//  UIView+AddingViews.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import UIKit

extension UIView {
    func addSubviews(_ array: [UIView]) {
        array.forEach {
            addSubview($0)
        }
    }
}

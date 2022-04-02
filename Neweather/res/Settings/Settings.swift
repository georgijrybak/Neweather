//
//  Settings.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import UIKit
//enum WeatherImages {
//    static let
//}

enum Colors {
    static let main = UIColor(named: "mainColor")
    static let secondary = UIColor(named: "secondColor")
    static let secondaryMain = UIColor(named: "secondaryMain")
}

class Settings {
    enum UserDefaultsKeys: String {
        case onboardingComplited
    }

    static var shared = Settings()

    var onboardingComplited: Bool {
        get {
            UserDefaults.standard.bool(
                forKey: UserDefaultsKeys.onboardingComplited.rawValue
            )
        }
        set {
            UserDefaults.standard.set(
                newValue,
                forKey: UserDefaultsKeys.onboardingComplited.rawValue
            )
        }
    }
}

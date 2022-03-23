//
//  Settings.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import UIKit

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

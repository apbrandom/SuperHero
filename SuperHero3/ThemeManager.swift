//
//  ThemeManager.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 20.08.2023.
//

import SwiftUI

class ThemeManager: ObservableObject {
    
    static let shared = ThemeManager()
    
    private let themeKey = "appTheme"
    
    var currentTheme: AppTheme {
        get {
            if let savedTheme = UserDefaults.standard.string(forKey: themeKey), let theme = AppTheme(rawValue: savedTheme) {
                return theme
            }
            return .system
        }
        set {
            UserDefaults.standard.setValue(newValue.rawValue, forKey: themeKey)
            applyTheme()
        }
    }
    
    private init() {}
    
    func applyTheme() {
            let style: UIUserInterfaceStyle = {
                switch currentTheme {
                case .dark:
                    return .dark
                case .light:
                    return .light
                case .system:
                    return .unspecified
                }
            }()
        
        for windowScene in UIApplication.shared.connectedScenes {
            if let windowScene = windowScene as? UIWindowScene {
                for window in windowScene.windows {
                    window.overrideUserInterfaceStyle = style
                }
            }
        }
    }
}






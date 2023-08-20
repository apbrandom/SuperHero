//
//  AppTheme.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 20.08.2023.
//

import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case system, light, dark
    
    var displayText: String {
        return self.rawValue.capitalized
    }
}



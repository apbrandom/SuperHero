//
//  SettingsView.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 08.08.2023.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var selectedLanguage = "English"
    @State private var volume: Double = 0.5
    @AppStorage("appTheme") private var appTheme: AppTheme = .system

    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    let languages = ["English", "Russian", "Spanish", "French"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    Picker("Language", selection: $selectedLanguage) {
                        ForEach(languages, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Theme", selection: $appTheme) {
                        ForEach(AppTheme.allCases) { theme in
                            Text(theme.displayText).tag(theme)
                        }
                    }
                    
                    Text(colorScheme == .dark ? "Dark Theme enabled" : "Light Theme enabled")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                
                Section(header: Text("Sound Settings")) {
                    Slider(value: $volume, in: 0...1) {
                        Text("Volume")
                    }
                }
            }
            .navigationTitle("Settings")
            .onChange(of: appTheme) { newTheme in
                ThemeManager.shared.currentTheme = newTheme
            }
        }
    }
}


#Preview {
    SettingsView()
}

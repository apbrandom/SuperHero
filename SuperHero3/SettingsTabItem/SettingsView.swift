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
    @AppStorage("appTheme") private var appTheme: String = "System"
    
    let languages = ["English", "Russian", "Spanish", "French"]
    let themes = ["System", "Light", "Dark"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Preferences")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    Picker("Language", selection: $selectedLanguage) {
                        ForEach(languages, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Theme", selection: $appTheme) {
                        ForEach(themes, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Sound Settings")) {
                    Slider(value: $volume, in: 0...1) {
                        Text("Volume")
                    }
                }
            }
            .navigationTitle("Settings")
            .preferredColorScheme(appTheme == "Dark" ? .dark : (appTheme == "Light" ? .light : nil))
        }
    }
}

#Preview {
    SettingsView()
}

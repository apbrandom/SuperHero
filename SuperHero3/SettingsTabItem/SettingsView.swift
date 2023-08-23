//
//  SettingsView.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 08.08.2023.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var networkManager = NetworkManager.shared
    @State private var firstHero: Hero?
    @AppStorage("notificationsEnabled") private var notificationsEnabled: Bool = true
    @AppStorage("selectedLanguege") private var selectedLanguage = "English"
    @AppStorage("volume") private var volume: Double = 0.5
    @AppStorage("appTheme") private var appTheme: AppTheme = .system
    @Binding var titleOn: Bool
    @Binding var heightRow: Double
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    let languages = ["English", "Russian", "Spanish", "French"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    
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
                    
                    Text(colorScheme == .dark ? "Dark Theme Enabled" : "Light Theme Enabled")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                
                Section(header: Text("Sound Settings")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    
                    Slider(value: $volume, in: 0...1) {
                        Text("Volume")
                    }
                }
                
                Section(header: Text("Interface")) {
                    Toggle("Navigation Title Enabled", isOn: $titleOn)
                    
                    Slider(value: $heightRow, in: 30...200)
                    if let heroSample = networkManager.heroes.first {
                        InfoRow(hero: heroSample, height: $heightRow)
                    }

                }
                
            }
            .navigationTitle("Settings")
            .onChange(of: appTheme) { newTheme in
                newTheme.apply()
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    @State static var mockTitleOn = true
    @State static var mockHeightRow: Double = 70
    
    static var previews: some View {
        SettingsView(titleOn: $mockTitleOn, heightRow: $mockHeightRow)
    }
}


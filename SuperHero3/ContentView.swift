//
//  ContentView.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 07.08.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("appTheme") private var appTheme: AppTheme = .system
    @AppStorage("titleOn") private var titleOn = true
    @AppStorage("heightRow") private var heightRow: Double = 70.0
    

    var body: some View { 
        TabView {
            InfoView(titleOn: $titleOn, heightRow: $heightRow)
                .tabItem {
                    Image(systemName: "figure.archery")
                }
            HelloView()
                .tabItem {
                    Image(systemName: "globe.asia.australia")
                }
            SettingsView(titleOn: $titleOn, heightRow: $heightRow)
                .tabItem {
                    Image(systemName: "gear")
                }
        }
        .onAppear{
            appTheme.apply()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

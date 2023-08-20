//
//  ContentView.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 07.08.2023.
//

import SwiftUI

struct StartingView: View {
    var body: some View {
        TabView {
            InfoView()
                .tabItem {
                    Image(systemName: "figure.archery")
                }
            HelloView()
                .tabItem {
                    Image(systemName: "globe.asia.australia")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView()
    }
}

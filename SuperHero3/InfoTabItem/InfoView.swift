//
//  InfoView.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 08.08.2023.
//

import SwiftUI

struct InfoView: View {
    @StateObject private var networkManager = NetworkManager.shared
    
    var body: some View {
        NavigationView {
            List(networkManager.heroes) { hero in
                NavigationLink {
                    InfoDetails(hero: hero)
                } label: {
                    InfoRow(hero: hero)
                }
            }
            .navigationTitle(Text("Super Heroes List"))
            .listStyle(.plain)
            .onAppear {
                networkManager.loadHeroes()
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

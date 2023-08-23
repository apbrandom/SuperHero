//
//  InfoView.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 08.08.2023.
//

import SwiftUI

struct InfoView: View {
    @StateObject private var networkManager = NetworkManager.shared
    @Binding var titleOn: Bool
    @Binding var heightRow: Double
    
    var body: some View {
        NavigationView {
            List(networkManager.heroes) { hero in
                NavigationLink {
                    InfoDetails(hero: hero)
                } label: {
                    InfoRow(hero: hero, height: $heightRow)
                }
            }
            .navigationTitle(titleOn ? "Super Heroes List" : "")
            .listStyle(.plain)
            .onAppear {
                networkManager.loadHeroes()
                
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(titleOn: .constant(true), heightRow: .constant(100.0))
    }
}


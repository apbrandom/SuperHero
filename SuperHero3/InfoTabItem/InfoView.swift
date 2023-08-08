//
//  InfoView.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 08.08.2023.
//

import SwiftUI

struct InfoView: View {
    @StateObject var viewModel = HeroesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.heroes) { hero in
                NavigationLink(destination: InfoDetails(hero: hero)) {
                    InfoRow(hero: hero)
                }
            }
            .navigationTitle(Text("Super Heroes List"))
            .onAppear {
                viewModel.loadHeroes()
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    InfoView()
}

//
//  PowerStats.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 08.08.2023.
//

import SwiftUI

struct InfoDetails: View {
    var hero: HeroResponse
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    DetailRow(title: "Intelligence", value: "\(hero.powerstats.intelligence)")
                    DetailRow(title: "Strength", value: "\(hero.powerstats.strength)")
                    DetailRow(title: "Speed", value: "\(hero.powerstats.speed)")
                    DetailRow(title: "Durability", value: "\(hero.powerstats.durability)")
                }
                
                Divider()
                
                Group {
                    DetailRow(title: "Power", value: "\(hero.powerstats.power)")
                    DetailRow(title: "Combat", value: "\(hero.powerstats.combat)")
                }
            }
            .padding()
        }
        .navigationTitle(hero.name)
    }
}

#Preview {
    InfoDetails(hero: HeroResponse(id: 1, name: "A-Bomb", images: HeroResponse.Images(sm: "https://url-to-image.com/image.jpg"), powerstats: HeroResponse.Powerstats(intelligence: 38, strength: 100, speed: 17, durability: 80, power: 24, combat: 64)))
}

//
//  PowerStats.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 08.08.2023.
//

import SwiftUI

struct InfoDetails: View {
    var hero: Hero
    @State private var image: UIImage?
    @StateObject private var networkManager = NetworkManager.shared
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                if let uiImage = image {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                
                Spacer()
                
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
        .onAppear{
            loadImage()
        }
    }
    func loadImage() {
        networkManager.loadImage(for: hero) { uiImage in
            DispatchQueue.main.async {
                image = uiImage
            }
        }
    }

}

struct InfoDetails_Previews: PreviewProvider {
    static var previews: some View {
        InfoDetails(hero: Hero(id: 1, name: "A-Bomb", images: HeroImage(sm: "", lg: ""), powerstats: Powerstats(intelligence: 38, strength: 100, speed: 17, durability: 80, power: 24, combat: 64)))
    }
}

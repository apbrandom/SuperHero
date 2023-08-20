//
//  InfoRow.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 07.08.2023.
//

import SwiftUI

struct InfoRow: View {
    var hero: Hero
    @StateObject private var networkManager = NetworkManager.shared
    @State private var image: UIImage?
    
    var body: some View {
        HStack {
            if let uiImage = image {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            VStack {
                HStack {
                    Text(hero.name)
                        .font(.headline)
                }
            }
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        networkManager.loadImage(for: hero) { uiImage in
            image = uiImage
        }
    }
}



struct InfoRow_Previews: PreviewProvider {
    static var previews: some View {
        InfoRow(hero: Hero(id: 1, name: "A-Bomb", images: HeroImage(sm: "", lg: ""), powerstats: Powerstats(intelligence: 38, strength: 100, speed: 17, durability: 80, power: 24, combat: 64)))
    }
}


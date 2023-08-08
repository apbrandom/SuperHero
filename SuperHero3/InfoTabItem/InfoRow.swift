//
//  InfoRow.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 07.08.2023.
//

import SwiftUI

struct InfoRow: View {
    var hero: HeroResponse
    @EnvironmentObject var viewModel: HeroesViewModel

    var body: some View {
        HStack {
            if let uiImage = viewModel.images[hero.id] {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
            } else {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
            }
            VStack {
                HStack {
                    Text("Name")
                    Text(hero.name)
                        .font(.headline)
                    Spacer()
                }
                HStack {
                    Text("ID")
                    Text("\(hero.id)")
                        .font(.headline)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    InfoRow(hero: HeroResponse(id: 1, name: "A-Bomb", images: HeroResponse.Images(sm: "https://url-to-image.com/image.jpg"), powerstats: HeroResponse.Powerstats(intelligence: 38, strength: 100, speed: 17, durability: 80, power: 24, combat: 64)))
}

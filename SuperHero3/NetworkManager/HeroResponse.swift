//
//  HeroResponse.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 08.08.2023.
//

import Foundation

struct HeroResponse: Decodable, Identifiable {
    let id: Int
    let name: String
    let images: Images
    let powerstats: Powerstats

    struct Images: Decodable {
        let sm: String
    }

    struct Powerstats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }
}


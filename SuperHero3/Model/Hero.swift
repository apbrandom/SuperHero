//
//  HeroResponse.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 08.08.2023.
//

import Foundation

//MARK: - Heroes
struct Hero: Decodable, Identifiable {
    let id: Int
    let name: String
    let images: HeroImage
    let powerstats: Powerstats
}

//MARK: - Images
struct HeroImage: Decodable {
    let sm, lg: String
}

//MARK: - Powertats
struct Powerstats: Decodable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}


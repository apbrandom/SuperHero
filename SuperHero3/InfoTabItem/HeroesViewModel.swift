//
//  HeroViewModel.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 08.08.2023.
//

import Foundation
import Combine
import UIKit

class HeroesViewModel: ObservableObject {
    @Published var heroes: [HeroResponse] = []
    @Published var images: [Int: UIImage] = [:] 
    private var cancellables: Set<AnyCancellable> = []

    func loadHeroes() {
        NetworkManager.shared.fetchHeroes { result in
            switch result {
            case .success(let heroes):
                DispatchQueue.main.async {
                    self.heroes = heroes
                    self.loadImages(for: heroes)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func loadImages(for heroes: [HeroResponse]) {
        heroes.forEach { hero in
            guard let url = URL(string: hero.images.sm) else { return }
            URLSession.shared.dataTaskPublisher(for: url)
                .map { UIImage(data: $0.data) }
                .replaceError(with: nil)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] uiImage in
                    self?.images[hero.id] = uiImage
                }
                .store(in: &cancellables)
        }
    }
}



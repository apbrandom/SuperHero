//
//  NetworkManager.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 08.08.2023.
//

import UIKit

final class NetworkManager: ObservableObject {
    
    static let shared = NetworkManager()
    
    @Published var heroes: [Hero] = []
    
    private init() { }
    
    func loadHeroes() {
        guard let url = URL(string: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json") else {
            print("Invalid URL")
            return
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.urlCache = URLCache(memoryCapacity: 10 * 1024 * 1024, diskCapacity: 50 * 1024 * 1024, diskPath: nil)
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching heroes: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let fetchedHeroes = try decoder.decode([Hero].self, from: data)
                DispatchQueue.main.async {
                    self.heroes = fetchedHeroes
                }
            } catch let decodeError {
                print("Decoding error: \(decodeError)")
            }
        }
        task.resume()
    }
    
    func loadImage(for hero: Hero, completion: @escaping (UIImage?) -> Void) {
        guard let imageUrl = URL(string: hero.images.lg) else {
            print("Invalid URL for image")
            completion(nil)
            return
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache(memoryCapacity: 126 * 1024 * 1024, diskCapacity: 512 * 1024 * 1024, diskPath: nil)
        let session = URLSession(configuration: configuration)
        
        session.dataTask(with: imageUrl) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error loading image: \(error)")
                    completion(nil)
                    return
                }
                guard let data = data, let image = UIImage(data: data) else {
                    print("Failed to load image data")
                    completion(nil)
                    return
                }
                completion(image)
            }
        }
        .resume()
    }

}

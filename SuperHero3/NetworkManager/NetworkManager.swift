//
//  NetworkManager.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 08.08.2023.
//

import Foundation
import SwiftUI

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    func loadImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }
        .resume()
    }
    
    func fetchHeroes(completion: @escaping (Result<[HeroResponse], Error>) -> Void ) {
        guard let url = URL(string: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // Setting a timeout of 30 seconds
        configuration.urlCache = URLCache(memoryCapacity: 10 * 1024 * 1024, diskCapacity: 50 * 1024 * 1024, diskPath: nil) // Caching setting
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 1, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let hero = try decoder.decode([HeroResponse].self, from: data)
                completion(.success(hero))
            } catch let decodeError {
                completion(.failure(decodeError))
            }
        }
        task.resume()
    }
    
}

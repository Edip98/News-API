//
//  NetworkManager.swift
//  UkraineNewsAPI
//
//  Created by Эдип on 14.10.2022.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private let baseURL = "https://newsapi.org/v2/top-headlines?country=ua&apiKey=ca2c90d0dd324e95b470e1156c41a904"
    
    private init() {}
    
    func getNews(compeleted: @escaping (Result<[Article], ErrorMessage>) -> Void) {
        
        guard let url = URL(string: baseURL) else {
            compeleted(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ = error {
                compeleted(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                compeleted(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                compeleted(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(APIResponse.self, from: data)
                compeleted(.success(decodedResponse.articles))
            } catch {
                compeleted(.failure(.unableToComplete))
            }
        }
        
        task.resume()
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        
        let casehKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: casehKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: casehKey)
            completed(image)
        }
        
        task.resume()
    }
}


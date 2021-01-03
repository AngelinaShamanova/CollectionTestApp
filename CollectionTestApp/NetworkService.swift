//
//  NetworkService.swift
//  AdApp
//
//  Created by Angelina on 03.01.2021.
//

import Foundation

class NetworkService {
    
    func request(urlString: String, completion: @escaping (Model?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error!")
                    completion(nil, error)
                    return
                }
                guard let data = data else { return }
                
                do {
                    let news = try JSONDecoder().decode(Model.self, from: data)
                    completion(news, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(nil, jsonError)
                }
                
            }
        }.resume()
    }
    
}

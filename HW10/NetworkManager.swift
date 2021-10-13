//
//  NetworkManager.swift
//  HW10
//
//  Created by Anton Duplin on 25/9/21.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    func fetchData(from url: String?, with complition: @escaping (Crypto) -> Void) {
        
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            
            do {
                let crypto = try JSONDecoder().decode(Crypto.self, from: data)
                complition(crypto)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    
}

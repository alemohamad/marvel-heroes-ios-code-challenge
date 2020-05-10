//
//  CharacterObject.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import Foundation

class CharacterObject: ObservableObject {
    
    @Published var characters = [Character]()
    @Published var totalCharacters = 0
    
    func getCharacters(byName name: String, using session: URLSession = .shared) {
        let endpoint = Endpoint.character(nameStartingWith: name)
        
        let task = session.dataTask(with: endpoint.url) { data, response, error in
            guard let data = data else {
                fatalError("No data")
            }
            
            do {
                let dataResults = try JSONDecoder().decode(DataResult.self, from: data)
                
                DispatchQueue.main.async {
                    self.totalCharacters = dataResults.data.total
                    self.characters = dataResults.data.results
                }
            } catch {
                fatalError("Bad format data")
            }
        }
        
        task.resume()
    }
    
}

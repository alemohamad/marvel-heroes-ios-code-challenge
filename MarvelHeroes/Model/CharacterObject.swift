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
            if let error = error {
                print(error.localizedDescription)
                fatalError("There was an API error")
            }
            
            guard response != nil else {
                fatalError("No data response")
            }
            
            guard let data = data else {
                fatalError("No valid data")
            }
            
            do {
                let dataResults = try JSONDecoder().decode(DataResult.self, from: data)
                
                DispatchQueue.main.async {
                    self.characters = dataResults.data.results
                    self.totalCharacters = dataResults.data.total
                }
            } catch {
                fatalError("Bad format data")
            }
        }
        
        task.resume()
    }
    
}

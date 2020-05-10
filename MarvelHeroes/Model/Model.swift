//
//  Model.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import Foundation

struct DataResult: Codable {
    let code: Int
    let status: String
    let data: Container
}

struct Container: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Character]
}

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: CharacterImage
    
    var fullDescription: String {
        self.description.isEmpty ? "No description" : self.description
    }
}

struct CharacterImage: Codable {
    let path: String
    let `extension`: String
    
    var completePath: String {
        let httpsPath = path.replacingOccurrences(of: "http", with: "https")
        return "\(httpsPath).\(`extension`)"
    }
    
    var url: URL? {
        return URL(string: completePath)
    }
}

//
//  Model.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import Foundation

struct DataCharacterResult: Codable {
    let code: Int
    let status: String
    let data: ContainerCharacter
}

struct ContainerCharacter: Codable {
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
    let thumbnail: Thumbnail
    
    var fullDescription: String {
        self.description.isEmpty ? "No description" : self.description
    }
}

struct DataComicResult: Codable {
    let code: Int
    let status: String
    let data: ContainerComic
}

struct ContainerComic: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Comic]
}

struct Comic: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
    let issueNumber: Int
    let isbn: String
    let pageCount: Int
    let format: String
    
    var fullDescription: String {
        return description ?? "No description"
    }
}

struct Thumbnail: Codable {
    let path: String
    let `extension`: String
    
    var completePath: String {
        let httpsPath = path.replacingOccurrences(of: "http://", with: "https://")
        return "\(httpsPath).\(`extension`)"
    }
    
    var url: URL? {
        return URL(string: completePath)
    }
}

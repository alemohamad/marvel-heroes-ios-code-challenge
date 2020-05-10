//
//  Endpoint.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import Foundation
import CryptoKit

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
    var limit: Int = 20
    var offset: Int = 0
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "gateway.marvel.com"
        components.path = "/v1/public/" + path
        components.queryItems = queryItems
        
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "limit",  value: String(limit)),
            URLQueryItem(name: "offset", value: String(offset))
        ])
        
        let timestamp = Int64(Date().timeIntervalSince1970.rounded())
        let apikey = "1b796dea877e215e9fe3ea4271dfdf86"
        let privatekey = "b8ed445193996840eae1852592d51177436bb224"
        
        if let strings2HashData = "\(timestamp)\(privatekey)\(apikey)".data(using: .utf8) {
            let hash = Insecure.MD5.hash(data: strings2HashData)
            let hashString = hash.compactMap { String(format: "%02x", $0) }.joined()
            
            components.queryItems?.append(contentsOf: [
                URLQueryItem(name: "apikey", value: apikey),
                URLQueryItem(name: "ts",     value: String(timestamp)),
                URLQueryItem(name: "hash",   value: hashString)
            ])
        }
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}

extension Endpoint {
    static func character(nameStartingWith name: String) -> Self {
        Endpoint(
            path: "characters",
            queryItems: [
                URLQueryItem(name: "nameStartsWith", value: name)
            ]
        )
    }
}

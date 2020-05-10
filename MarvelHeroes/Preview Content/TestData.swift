//
//  TestData.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import Foundation

struct TestData {
    static let characterImage = CharacterImage(
        path: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/526548a343e4b",
        extension: "jpg"
    )
    
    static let character = Character(
        id: 1,
        name: "Spider-Man",
        description: "Bitten by a radioactive spider, high school student Peter Parker gained the speed, strength and powers of a spider. Adopting the name Spider-Man, Peter hoped to start a career using his new abilities. Taught that with great power comes great responsibility, Spidey has vowed to use his powers to help people.",
        thumbnail: characterImage
    )
    
    static let characters = [character, character, character, character, character]
}

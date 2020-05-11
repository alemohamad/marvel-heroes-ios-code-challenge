//
//  TestData.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import Foundation

struct TestData {
    static let characterImage = Thumbnail(
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
    
    static let comicImage = Thumbnail(
        path: "http://i.annihil.us/u/prod/marvel/i/mg/9/80/59b3104f67eaf",
        extension: "jpg"
    )
    
    static let comic = Comic(
        id: 1,
        title: "Spider-Man: 101 Ways to End the Clone Saga (1997) #1",
        description: "Spider-Man's Clone Saga has spun completely out of control! There's only one team that can save the wall-crawler now: the Marvel editors! Bob Harras, Ralph Macchio, Tom Brevoort, and more put their heads together to see if ANYTHING can get Spidey out of this doppelganger debacle!",
        thumbnail: comicImage,
        issueNumber: 1,
        isbn: "0-7851-2010-6",
        pageCount: 36,
        format: "Comic"
    )
}

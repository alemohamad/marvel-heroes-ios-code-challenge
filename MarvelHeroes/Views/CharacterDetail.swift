//
//  CharacterDetail.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct CharacterDetail: View {
    let character: Character
    
    var body: some View {
        ScrollView {
            VStack {
                Image("spiderman")
                    .resizable()
                    .scaledToFit()
                
                Text(character.description)
                    .foregroundColor(.primary)
                    .padding()
            }
        }
        .navigationBarTitle(Text(character.name), displayMode: .inline)
    }
}

struct CharacterDetail_Previews: PreviewProvider {
    static let character = TestData.character
    
    static var previews: some View {
        NavigationView {
            CharacterDetail(character: character)
        }
    }
}

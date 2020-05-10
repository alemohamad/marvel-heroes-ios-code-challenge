//
//  CharacterDetail.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import SwiftUI
import URLImage

struct CharacterDetail: View {
    let character: Character
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                URLImage(character.thumbnail.url!,
                         delay: 0.25,
                         placeholder: Image("marvel-placeholder")
                            .resizable()
                ) { proxy in
                    proxy.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                Text(character.fullDescription)
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

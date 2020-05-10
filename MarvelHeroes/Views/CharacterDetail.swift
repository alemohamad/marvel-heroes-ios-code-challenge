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
    @ObservedObject var characterObject = CharacterObject()
    let character: Character
    
    var body: some View {
        List {
            ForEach(characterObject.comics) { comic in
                NavigationLink(destination: ComicDetailView(comic: comic)) {
                    HStack(alignment: .top, spacing: 16) {
                        VStack {
                            URLImage(comic.thumbnail.url!,
                                     delay: 0.25,
                                     processors: [ Resize(size: CGSize(width: 100.0, height: 140.0), scale: UIScreen.main.scale) ],
                                     placeholder: Image("marvel-placeholder")
                                        .resizable()
                            ) { proxy in
                                proxy.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipped()
                            }
                            .frame(width: 100.0, height: 140.0)
                            
                            Group {
                                Text("Issue #\(comic.issueNumber)")
                                    .bold()
                                
                                Text("\(comic.pageCount) pages")
                            }
                            .font(.caption)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(comic.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(comic.fullDescription)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(character.name), displayMode: .inline)
        .navigationBarItems(trailing:
            Text("\(characterObject.totalComics)")
                .font(.caption)
        )
        .onAppear {
            self.characterObject.getComics(byCharacterID: self.character.id)
        }
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

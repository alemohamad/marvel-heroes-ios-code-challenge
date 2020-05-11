//
//  HeroesComicsView.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import SwiftUI
import URLImage

struct HeroesComicsView: View {
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
                                     processors: [ Resize(size: CGSize(width: 100.0, height: 160.0), scale: UIScreen.main.scale) ],
                                     placeholder: Image("marvel-placeholder")
                                        .resizable()
                            ) { proxy in
                                proxy.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipped()
                            }
                            .frame(width: 100.0, height: 160.0)
                            .shadow(radius: 10)
                            
                            Group {
                                if comic.issueNumber > 0 {
                                    Text("Issue #\(comic.issueNumber)")
                                        .bold()
                                }
                                
                                if comic.pageCount > 0 {
                                    Text("\(comic.pageCount) pages")
                                }
                            }
                            .font(.caption)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(comic.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(comic.fullDescription)
                                .lineLimit(4)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .onAppear {
                            let isLast = self.characterObject.isLastComic(id: comic.id)
                            
                            if isLast {
                                self.characterObject.getComics(byCharacterID: self.character.id)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle(Text(character.name), displayMode: .inline)
        .navigationBarItems(trailing:
            Text("\(characterObject.comics.count) / \(characterObject.totalComics)")
                .font(.caption)
        )
        .onAppear {
            self.characterObject.getComics(byCharacterID: self.character.id)
        }
    }
}

struct HeroesComicsView_Previews: PreviewProvider {
    static let character = TestData.character
    
    static var previews: some View {
        NavigationView {
            HeroesComicsView(character: character)
        }
    }
}

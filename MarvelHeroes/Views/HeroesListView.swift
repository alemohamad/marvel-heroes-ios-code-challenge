//
//  HeroesListView.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import SwiftUI
import URLImage

struct HeroesListView: View {
    @ObservedObject var characterObject = CharacterObject()
    @State private var nameToSearch = ""
    
    var body: some View {
        NavigationView {
            List {
                Color.clear
                    .frame(height: 40)
                
                ForEach(self.characterObject.characters) { character in
                    NavigationLink(destination: HeroesComicsView(character: character)) {
                        CharacterCellView(nameToSearch: self.nameToSearch, character: character, isLast: self.characterObject.isLastCharacter(id: character.id))
                    }
                }
                
                Color.clear
                    .frame(height: 40)
            }
            .edgesIgnoringSafeArea(.bottom)
            .overlay(
                ZStack(alignment: .trailing) {
                    TextField("", text: $nameToSearch,
                              onCommit: {
                                self.characterObject.getCharacters(byName: self.nameToSearch)
                    })
                        .keyboardType(.webSearch)
                        .foregroundColor(Color.white)
                    
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 14)
                .background(
                    Capsule()
                        .fill(Color.secondary)
                )
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                , alignment: .top)
            .navigationBarTitle(Text("Marvel Heroes"), displayMode: .inline)
            .navigationBarItems(
                trailing: Text("\(characterObject.characters.count) / \(characterObject.totalCharacters)")
                    .font(.caption)
            )
            .onAppear {
                self.characterObject.getCharacters(byName: self.nameToSearch)
            }
        }
        .environmentObject(characterObject)
    }
}

extension HeroesListView {
    struct CharacterCellView: View {
        @EnvironmentObject var characterObject: CharacterObject
        let nameToSearch: String
        let character: Character
        let isLast: Bool
        
        var body: some View {
            HStack(alignment: .top, spacing: 16.0) {
                URLImage(character.thumbnail.url!,
                         delay: 0.25,
                         processors: [ Resize(size: CGSize(width: 100.0, height: 100.0), scale: UIScreen.main.scale) ],
                         placeholder: Image("marvel-placeholder")
                            .resizable()
                ) { proxy in
                    proxy.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 100, height: 100)
                .shadow(radius: 5)
                
                VStack(alignment: .leading, spacing: 8.0) {
                    Text(character.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(character.fullDescription)
                        .lineLimit(nil)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .onAppear {
                    if self.isLast {
                        self.characterObject.getCharacters(byName: self.nameToSearch)
                    }
                }
            }
            .padding(.horizontal, 8.0)
            .padding(.vertical, 16.0)
        }
    }
}

struct HeroesListView_Previews: PreviewProvider {
    static let character = TestData.character
    
    static var previews: some View {
        Group {
            HeroesListView()
                .previewDisplayName("List of Character")
            
            HeroesListView.CharacterCellView(nameToSearch: "", character: character, isLast: false)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Character Item")
            
            HeroesListView.CharacterCellView(nameToSearch: "", character: character, isLast: false)
                .previewLayout(.sizeThatFits)
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Character Item - Dark Mode")
        }
    }
}

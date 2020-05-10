//
//  HeroesListView.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct HeroesListView: View {
    @ObservedObject var characterObject = CharacterObject()
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.characterObject.characters) { character in
                    NavigationLink(destination: CharacterDetail(character: character)) {
                        CharacterCellView(character: character)
                    }
                }
            }
            .navigationBarTitle(Text("Marvel Heroes"), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            )
            .onAppear {
                self.characterObject.getCharacters(byName: "Sp")
            }
        }
    }
}

extension HeroesListView {
    struct CharacterCellView: View {
        let character: Character
        
        var body: some View {
            HStack(alignment: .top, spacing: 16.0) {
                Image("spiderman")
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 80, height: 80)
                    .shadow(radius: 10)
                
                VStack(alignment: .leading, spacing: 8.0) {
                    Text(character.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(character.description)
                        .lineLimit(3)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(8.0)
        }
    }
}

struct HeroesListView_Previews: PreviewProvider {
    static let character = TestData.character
    
    static var previews: some View {
        Group {
            HeroesListView()
            
            HeroesListView()
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode")
            
            HeroesListView.CharacterCellView(character: character)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("List character")
        }
    }
}

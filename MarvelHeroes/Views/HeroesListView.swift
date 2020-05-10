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
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        NavigationView {
            List {
                Color.clear
                    .frame(height: 40)
                
                ForEach(self.characterObject.characters) { character in
                    NavigationLink(destination: CharacterDetail(character: character)) {
                        CharacterCellView(character: character)
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
            .navigationBarItems(trailing:
                Text("\(characterObject.totalCharacters)")
                    .font(.caption)
            )
            .onAppear {
                self.characterObject.getCharacters(byName: self.nameToSearch)
            }
        }
    }
}

extension HeroesListView {
    struct CharacterCellView: View {
        let character: Character
        
        var body: some View {
            HStack(alignment: .top, spacing: 16.0) {
                URLImage(character.thumbnail.url!,
                         delay: 0.25,
                         processors: [ Resize(size: CGSize(width: 80.0, height: 80.0), scale: UIScreen.main.scale) ],
                         placeholder: Image("marvel-placeholder")
                            .resizable()
                ) { proxy in
                    proxy.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 80, height: 80)
                .shadow(radius: 10)
                
                VStack(alignment: .leading, spacing: 8.0) {
                    Text(character.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(character.fullDescription)
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
                .previewDisplayName("List of Character")
            
            HeroesListView.CharacterCellView(character: character)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Character Item")
            
            HeroesListView.CharacterCellView(character: character)
                .previewLayout(.sizeThatFits)
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Character Item - Dark Mode")
        }
    }
}

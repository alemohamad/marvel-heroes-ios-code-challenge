//
//  HeroesListView.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct HeroesListView: View {
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<5) { i in
                    NavigationLink(destination: CharacterDetail()) {
                        CharacterCellView()
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
        }
    }
}

extension HeroesListView {
    struct CharacterCellView: View {
        var body: some View {
            HStack(alignment: .top, spacing: 16.0) {
                Image("spiderman")
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 80, height: 80)
                    .shadow(radius: 10)
                
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("Spider-Man")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text("Bitten by a radioactive spider, high school student Peter Parker gained the speed, strength and powers of a spider. Adopting the name Spider-Man, Peter hoped to start a career using his new abilities. Taught that with great power comes great responsibility, Spidey has vowed to use his powers to help people.")
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
    static var previews: some View {
        Group {
            HeroesListView()
            
            HeroesListView()
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode")
            
            HeroesListView.CharacterCellView()
                .previewLayout(.sizeThatFits)
                .previewDisplayName("List character")
        }
    }
}

//
//  ComicDetailView.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import SwiftUI
import URLImage

struct ComicDetailView: View {
    let comic: Comic
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                URLImage(comic.thumbnail.url!,
                         delay: 0.25,
                         processors: [ Resize(size: CGSize(width: 180.0, height: 280.0), scale: UIScreen.main.scale) ],
                         placeholder: Image("marvel-placeholder")
                            .resizable()
                ) { proxy in
                    proxy.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                }
                .frame(width: 200.0, height: 320.0)
                .shadow(radius: 10)
                
                Text(comic.title)
                    .font(.title)
            }
            .padding()
        }
        .navigationBarTitle(comic.title)
    }
}

struct ComicDetailView_Previews: PreviewProvider {
    static let comic = TestData.comic
    
    static var previews: some View {
        ComicDetailView(comic: comic)
    }
}

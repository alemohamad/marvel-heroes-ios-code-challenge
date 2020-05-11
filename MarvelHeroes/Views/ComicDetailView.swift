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
            VStack(alignment: .leading, spacing: 16) {
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
                    .bold()
                    .foregroundColor(.primary)
                    .lineLimit(nil)
                
                Text(comic.fullDescription)
                    .foregroundColor(.secondary)
                    .font(.caption)
                
                Divider()
                
                HStack(spacing: 16) {
                    VStack(alignment: .leading) {
                        Text("Format")
                            .bold()
                        Text(comic.format)
                    }
                    
                    Spacer()
                    
                    if !comic.isbn.isEmpty {
                        VStack(alignment: .trailing) {
                            Text("ISBN")
                                .bold()
                            Text(comic.isbn)
                        }
                    }
                }
                .font(.footnote)
                
                Divider()
                
                HStack(spacing: 16) {
                    if comic.issueNumber > 0 {
                        Text("Issue #\(comic.issueNumber)")
                            .bold()
                    }
                    
                    Spacer()
                    
                    if comic.pageCount > 0 {
                        Text("\(comic.pageCount) pages")
                            .bold()
                    }
                }
                .font(.footnote)
            }
            .padding()
        }
        .navigationBarTitle(Text(comic.title), displayMode: .inline)
    }
}

struct ComicDetailView_Previews: PreviewProvider {
    static let comic = TestData.comic
    
    static var previews: some View {
        Group {
            NavigationView {
                ComicDetailView(comic: comic)
            }
            .previewDisplayName("Comic Detail")
            
            NavigationView {
                ComicDetailView(comic: comic)
            }
            .previewDisplayName("Comic Detail - Dark Mode")
            .background(Color(.systemBackground))
            .environment(\.colorScheme, .dark)
        }
    }
}

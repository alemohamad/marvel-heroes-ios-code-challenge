//
//  ComicDetailView.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct ComicDetailView: View {
    let comic: Comic
    
    var body: some View {
        Text("Comic: \(comic.title)")
    }
}

struct ComicDetailView_Previews: PreviewProvider {
    static let comic = TestData.comic
    
    static var previews: some View {
        ComicDetailView(comic: comic)
    }
}

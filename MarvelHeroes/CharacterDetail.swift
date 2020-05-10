//
//  CharacterDetail.swift
//  MarvelHeroes
//
//  Created by Ale Mohamad on 10/05/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct CharacterDetail: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("spiderman")
                    .resizable()
                    .scaledToFit()
                
                Text("Bitten by a radioactive spider, high school student Peter Parker gained the speed, strength and powers of a spider. Adopting the name Spider-Man, Peter hoped to start a career using his new abilities. Taught that with great power comes great responsibility, Spidey has vowed to use his powers to help people.")
                    .foregroundColor(.primary)
                    .padding()
            }
        }
        .navigationBarTitle(Text("Spider-Man"), displayMode: .inline)
    }
}

struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CharacterDetail()
        }
    }
}

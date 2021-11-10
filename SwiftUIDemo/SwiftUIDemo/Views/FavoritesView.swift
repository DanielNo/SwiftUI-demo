//
//  FavoritesView.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/9/21.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favs: FavoritePokemon
    var keys : [Int] {
        return Array(favs.favorites.keys)
    }
    
    var body: some View {
        List{
            ForEach(favs.favorites.filter({ key,val in
                val == 1
            }).sorted(by: >), id: \.key) { key, value in
                PokemonListItemView(number: key)
            }
        }.navigationTitle("My favorite Pokemon")

    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

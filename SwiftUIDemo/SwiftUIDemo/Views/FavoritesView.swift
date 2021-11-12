//
//  FavoritesView.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/9/21.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesModel : FavoritePokemon
    
    var body: some View {
        List{
            
            ForEach(favoritesModel.favoritesArray) { p in
                PokemonListItemView(pokemon: p)

            }
        }.navigationTitle("My favorite Pokemon")

    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

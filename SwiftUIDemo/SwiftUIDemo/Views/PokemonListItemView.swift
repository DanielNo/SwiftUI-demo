//
//  PokemonListItemView.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/9/21.
//

import SwiftUI

struct PokemonListItemView: View {
    var pokemon : Pokemon
    @EnvironmentObject var favoritesModel : FavoritePokemon
    var body : some View{
        
        HStack{
            Spacer(minLength: 50)
            GeometryReader { geoProxy in
                Image("\(self.imageName(pokemon.id))", bundle: .main)
                    .resizable()
                    .scaledToFit()
            }
            .background(Color.red)
            Spacer()
            Button {
                favoritesModel.toggleFavorite(pokemon)
            } label: {
                let image = favoritesModel.isFavorite(pokemon) ? "heart.fill" : "heart"
                Image(systemName: image)
            }.buttonStyle(.plain)
            
            

            
            Spacer(minLength: 40)
            
        }
    }
    
    func imageName(_ row : Int)->String{
        var image = ""
        if row > 9 && row < 100{
            image = "0\(row)"
        }else{
            image = "\(row)"
        }
        return image
    }
}

struct PokemonListItemView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListItemView(pokemon: Pokemon(id: 150))
    }
}

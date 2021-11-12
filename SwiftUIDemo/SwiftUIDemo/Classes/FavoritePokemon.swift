//
//  FavoritePokemon.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/9/21.
//

import Foundation
import SwiftUI


public class FavoritePokemon : ObservableObject{
    @AppStorage("favorites", store:.standard) var favoritesArray : [Pokemon] = []

    func toggleFavorite(_ pokemon : Pokemon){
        if self.isFavorite(pokemon){
            self.removeFromFavorites(pokemon)
        }else{
            self.addToFavorites(pokemon)
        }
    }

    
    func addToFavorites(_ pokemon : Pokemon){
        favoritesArray.append(pokemon)
    }
    
    func removeFromFavorites(_ pokemon : Pokemon){
        let index = favoritesArray.firstIndex { poke in
            poke.id == pokemon.id
        }
        
        guard let _ = index else{
            return
        }
        
        favoritesArray.remove(at: index!)

    }
    
    func isFavorite(_ pokemon : Pokemon) -> Bool{
        if favoritesArray.contains(pokemon){
            return true
        }else{
            return false
        }
        
    }
    
    
}

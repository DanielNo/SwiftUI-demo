//
//  FavoritePokemon.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/9/21.
//

import Foundation
import SwiftUI


public class FavoritesModel : ObservableObject{
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

public class FavoritePokemon : ObservableObject{
    @Published var favorites : [Int:Int]
    private var defaults : UserDefaults
    
    @AppStorage("should_show_hello_world", store: .standard) var shouldShowHelloWorld: Bool = false

    init(){
        defaults = UserDefaults.standard
        defaults.register(defaults: ["favorites" : [:]])
        let favs = defaults.dictionary(forKey: "favorites") as? [Int:Int] ?? [:]
        favorites = favs
        
    }
    
    func addFavorite(_ pokemon : Pokemon){
        let id = pokemon.id
        favorites[id] = 1
        defaults.setValue(favorites, forKey: "favorites")
    }
    
    func removeFavorite(_ pokemon : Pokemon){
        favorites[pokemon.id] = 0
        defaults.setValue(favorites, forKey: "favorites")
    }
    
    
}

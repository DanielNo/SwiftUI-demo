//
//  FavoritePokemon.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/9/21.
//

import Foundation

public class FavoritePokemon : ObservableObject{
    @Published var favorites : [Int:Int]
    private var defaults : UserDefaults
    
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

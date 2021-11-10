//
//  PokemonListItemView.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/9/21.
//

import SwiftUI

struct PokemonListItemView: View {
    @State var number : Int = 0
    @EnvironmentObject var favorites : FavoritePokemon
    var body : some View{
        
        HStack{
            Spacer(minLength: 50)
            GeometryReader { geoProxy in
                Image("\(self.imageName(number))", bundle: .main)
                    .resizable()
                    .scaledToFit()
            }
            .background(Color.red)
            Spacer()
            Button {
//                favorites.
            } label: {
                Image(systemName: "heart.fill")
            }

            
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
        PokemonListItemView()
    }
}

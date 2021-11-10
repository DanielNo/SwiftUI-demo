//
//  ImageListView.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/8/21.
//

import Foundation
import SwiftUI


// TableView Equivalent
struct ImageListView : View{
    
    var body : some View{
        NavigationView{
            List{
                ForEach(1..<150){ row in
                    NavigationLink(destination: PokemonDetailView(number: row).navigationTitle("\(row)"), label: {
                        PokemonListItemView(number: row)
                    })
                        .frame(height: 100, alignment: .trailing)
                        .background(Color.green)
                    
                    
                }
                
            }.navigationTitle("Navigation Title")
        }
        
        
        
    }
    
    
    
}


struct PokemonDetailView : View{
    @State var number : Int = 0
    
    var body : some View{
        HStack{
            Image("\(self.imageName(number))", bundle: .main)
                .aspectRatio(contentMode: .fit).background(Color.red)
            Text("Pokemon Detail : \(number)")
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




struct TestView : View{
    var columns: [GridItem] =
    Array(repeating: .init(.flexible()), count: 2)
    
    var body : some View{
        
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach((0...79), id: \.self) {
                    let codepoint = $0 + 0x1f600
                    let codepointString = String(format: "%02X", codepoint)
                    Text("\(codepointString)")
                    let emoji = String(Character(UnicodeScalar(codepoint)!))
                    Text("\(emoji)")
                }
            }.font(.largeTitle)
        }
        
    }
    
}



struct ImageListView_PreviewProvider : PreviewProvider{
    static var previews: some View {
        ImageListView()
    }
    
    
    
    
}

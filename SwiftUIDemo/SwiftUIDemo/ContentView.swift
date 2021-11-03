//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 8/24/21.
//

import SwiftUI
extension Font{
    
}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Turtle Rock")
                .font(.title)
            
            HStack{
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California").font(.subheadline)
            }
        }.padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



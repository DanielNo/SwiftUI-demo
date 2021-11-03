//
//  LoginView.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/2/21.
//

import SwiftUI

struct LoginView: View {
    @State var username : String = ""
    @State var password : String = ""
    
    @State var agreeToTerms : Bool = false
    
    
    
    var body: some View {
        NavigationView{
            
            
            
        }
    }
    
    func login(){
        print("logging in")
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

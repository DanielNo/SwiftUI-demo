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
    
    @State var alertPresented : Bool = false
    @State var alertMessage : String = ""

    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            Form{
                TextField("title", text: $username, prompt: Text("Username"))
                SecureField("a", text: $password, prompt: Text("Password"))
                    .onSubmit {
                        login()
                    }
                
            }
            Button {
                login()
            } label: {
                HStack{
                Text("Submit")
                    Image(systemName: "pencil")
                }
                .padding(20)
                .background(Color.yellow)
                .cornerRadius(10)
            }.alert("Title", isPresented: $alertPresented) {
                Button("ok") {
                    alertPresented = false
                }
            } message: {
                Text(alertMessage)
            }
            Spacer()

        })

    }
    
    
}

extension LoginView{
    func login(){
        guard username.count > 0 else{
            alertMessage = "Invalid username"

            alertPresented = true
            return
        }
        
        guard password.count > 0 else{
            alertMessage = "Invalid password"

            alertPresented = true

            return
        }

        print("logging in")
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

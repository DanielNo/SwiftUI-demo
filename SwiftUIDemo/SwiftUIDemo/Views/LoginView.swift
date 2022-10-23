//
//  LoginView.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/2/21.
//

import SwiftUI

struct LoginView: View {
    @StateObject var authenticator : Authenticator = Authenticator()

    @State var agreeToTerms : Bool = false
    
    @State var alertPresented : Bool = false
    @State var alertMessage : String = ""
    

    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            Form{
                Group{
                    TextField("title", text: $authenticator.username, prompt: Text("Username"))
                        .keyboardType(.emailAddress)
                        .textContentType(.username)
                        .autocapitalization(.none)
                    SecureField("a", text: $authenticator.password, prompt: Text("Password"))
                        .keyboardType(.default)
                        .textContentType(.password)
                        .autocapitalization(.none)

                    Button {
//                        authenticator.login
                        
                    } label: {
                        Text("Biometrics login")
                    }


//                    TextField("title", text: $userRegData.numberPasscode, prompt: Text("#### Passcode"))
//                        .keyboardType(.numberPad)

                }.onSubmit {
                    login()
                }.submitLabel(.go)
                
            }
            submitButton()
            Spacer()
        
        })

        
        
    }
    
    
    private struct SubmitButton : View{
        var closureMethod : ()->()
        var body : some View{
            
            return Text("")
        }
    }
}


extension LoginView{
    
    func submitButton() -> some View{
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

    }
    
    func login(){
        guard authenticator.username.count > 0 else{
            alertMessage = "Invalid username"

            alertPresented = true
            return
        }
        
        guard authenticator.password.count > 0 else{
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

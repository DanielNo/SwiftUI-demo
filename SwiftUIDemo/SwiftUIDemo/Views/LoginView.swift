//
//  LoginView.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/2/21.
//

import SwiftUI

struct LoginView: View {
    @StateObject var userRegData : UserRegistrationData = UserRegistrationData()

    @State var agreeToTerms : Bool = false
    
    @State var alertPresented : Bool = false
    @State var alertMessage : String = ""
    

    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            Form{
                Group{
                    TextField("title", text: $userRegData.username, prompt: Text("Username"))
                        .keyboardType(.emailAddress)
                    SecureField("a", text: $userRegData.password, prompt: Text("Password"))
                        .keyboardType(.default)
                    TextField("title", text: $userRegData.numberPasscode, prompt: Text("#### Passcode"))
                        .keyboardType(.numberPad)

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
        guard userRegData.username.count > 0 else{
            alertMessage = "Invalid username"

            alertPresented = true
            return
        }
        
        guard userRegData.password.count > 0 else{
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

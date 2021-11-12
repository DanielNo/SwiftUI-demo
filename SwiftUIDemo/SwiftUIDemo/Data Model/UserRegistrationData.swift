//
//  UserRegistrationData.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/10/21.
//

import Foundation

final class UserRegistrationData : ObservableObject{
    @Published var username : String = ""
    @Published var password : String = ""
    
    private var passcodeCharLimit : Int = 4
    @Published var numberPasscode : String = ""{
        didSet{
            if numberPasscode.count > passcodeCharLimit {
                // iOS 15 bug workaround, wrap the call in dispatchqueue async to fix.
                DispatchQueue.main.async { [unowned self] in
                    self.numberPasscode = String(self.numberPasscode.prefix(passcodeCharLimit))
                    print(numberPasscode)
                }
            }
        }
    }
    
    func validateRegistrationForm(){
        
    }

    
    
}

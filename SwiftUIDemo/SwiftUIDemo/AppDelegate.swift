//
//  AppDelegate.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/15/21.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("did finish launching")
        
        return true
    }
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        print("opening url: \(url.absoluteString)")
        
        return true
    }
}

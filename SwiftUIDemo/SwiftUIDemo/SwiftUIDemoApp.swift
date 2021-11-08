//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 8/24/21.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("did finish launching")
        
        return true
    }
}


@main
struct SwiftUIDemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @Environment(\.scenePhase) private var scenePhase


    var body: some Scene {
        WindowGroup {
//            ContentView()
            
            MainTabBar()
            
        }.onChange(of: scenePhase) { newPhase in
            
            switch(newPhase){
            case .active:
                print("Scene delegate active")
            case .background:
                print("Scene delegate background")
            case .inactive:
                print("Scene delegate inactive")
                
            @unknown default:
                print("unknown default")
            }
            
        }
    }
}

struct MainTabBar : View{
    var body: some View {
        TabView {
            LoginView()
                .tabItem {
                Text("Tab 1")
            }

            ContentView()
                .tabItem {
                Text("Tab 2")
            }
            MapView()
                .tabItem{
                    Text("Tab 3")
                }

        }

        
    }
}

struct SwiftUIDemoApp_PreviewProvider : PreviewProvider{
    static var previews: some View {
        MainTabBar()
    }

}

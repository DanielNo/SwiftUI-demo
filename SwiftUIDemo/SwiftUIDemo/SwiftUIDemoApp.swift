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
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        print("opening url: \(url.absoluteString)")
        
        return true
    }
}


@main
struct SwiftUIDemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @Environment(\.scenePhase) private var scenePhase
    
    let defaults : UserDefaults = {
        let defaults = UserDefaults.standard
        defaults.register(defaults: ["Favorites":[]])
        return defaults
    }()
    

    var body: some Scene {
        WindowGroup {
            MainTabBar()
        }
        .onChange(of: scenePhase) { newPhase in
            
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
    @StateObject var favorites: FavoritePokemon = FavoritePokemon()

    var body: some View {
        TabView {
            ImageListView()
                .tabItem {
                Text("Table")
            }

            LoginView()
                .tabItem {
                Text("Login")
            }

            MapView()
                .tabItem{
                    Text("Map")
                }
            
            FavoritesView()
                .tabItem {
                    Text("Favorites")
                }

        }.environmentObject(favorites)

        
    }
}

struct SwiftUIDemoApp_PreviewProvider : PreviewProvider{
    static var previews: some View {
        MainTabBar()
            .previewInterfaceOrientation(.portrait)
        
        MainTabBar()
            .previewInterfaceOrientation(.landscapeLeft)
    }

}

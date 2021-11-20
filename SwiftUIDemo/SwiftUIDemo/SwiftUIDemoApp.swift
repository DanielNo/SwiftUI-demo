//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 8/24/21.
//

import SwiftUI
import Foundation


@main
struct SwiftUIDemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @Environment(\.scenePhase) private var scenePhase
        
    @StateObject var favoritesModel : FavoritePokemon = FavoritePokemon()
    @StateObject var router : AppRouter = AppRouter()

    var body: some Scene {
        WindowGroup {
            MainTabBar()
                .environmentObject(favoritesModel)
                .environmentObject(router)
                .onOpenURL { url in
                    self.handleDeepLink(url)
                }
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
    
    func handleDeepLink(_ url : URL){
        let nsur = url as? NSURL
        let lastp = nsur?.lastPathComponent
        print("opening url : \(url)")
        
        // fix this parsing, but this is a working solution
        router.path = RouterPath.ThirdTab.rawValue
        
    }
    
    
    
}


struct MainTabBar : View{
    @EnvironmentObject var favoritesModel : FavoritePokemon
    @EnvironmentObject var router : AppRouter

    var body: some View {
        TabView(selection: $router.path) {
            ImageLoaderListView()
                .tabItem {
                    Text("Favorites")
                }
                .tag(RouterPath.FirstTab.rawValue)
            
            ImageListView()
                .tabItem {
                Text("Table")
                }
                .tag(RouterPath.SecondTab.rawValue)

            LoginView()
                .tabItem {
                Text("Login")
            }
                .tag(RouterPath.ThirdTab.rawValue)

            FavoritesView()
                .tabItem {
                    Text("Favorites")
                }
                .tag(RouterPath.FourthTab.rawValue)


        }
    }
    
    
    
}

struct SwiftUIDemoApp_PreviewProvider : PreviewProvider{
    let favoriteEnvObj = FavoritePokemon()
    static var previews: some View {
//        MainTabBar(selectedItem: 1)
//            .previewInterfaceOrientation(.portrait)
//            .environmentObject(FavoritePokemon())

        MainTabBar()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(FavoritePokemon())

//        MainTabBar()
//            .previewInterfaceOrientation(.landscapeLeft)
//            .environmentObject(FavoritePokemon())

    }

}

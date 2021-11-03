//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 8/24/21.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            
            MainTabBar()
            
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

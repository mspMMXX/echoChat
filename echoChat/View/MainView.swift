//
//  MainView.swift
//  echoChat
//
//  Created by Markus Platter on 27.02.25.
//

import SwiftUI

struct MainView: View {
    
    // For a logout option
    @AppStorage("isLoggedIn") private var isLoggedIn:Bool = false
    
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Label("Feed", systemImage: "bubble.left.and.bubble.right")
                }
            EchoView()
                .tabItem {
                    Label("Echo", systemImage: "bubble.left")
                }
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    MainView()
}

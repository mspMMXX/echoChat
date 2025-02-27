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
            /*AllEchosView()
                .tabItem {
                    Label("All Echos", systemImage: "list.bullet")
                }*/
            EchoView()
                .tabItem {
                    Label("Echo", systemImage: "speaker")
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

//
//  echoChatApp.swift
//  echoChat
//
//  Created by Markus Platter on 19.02.25.
//

import SwiftUI
import FirebaseCore

@main
struct echoChatApp: App {
    
    @AppStorage("isLoggedIn") private var isLoggedIn:Bool = false
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}

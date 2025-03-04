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
    @StateObject var userSession: UserSession = UserSession()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainView()
                    .environmentObject(userSession)
            } else {
                LoginView()
                    .environmentObject(userSession)
            }
        }
    }
}

//
//  UserSession.swift
//  echoChat
//
//  Created by Markus Platter on 04.03.25.
//
import SwiftUI

class UserSession: ObservableObject {
    
    @Published var currentUser: User?
    
    func login(user: User) {
        self.currentUser = user
    }
    
    func logout() {
        self.currentUser = nil
    }
}

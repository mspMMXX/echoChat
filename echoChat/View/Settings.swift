//
//  Settings.swift
//  echoChat
//
//  Created by Markus Platter on 27.02.25.
//

import SwiftUI

struct Settings: View {
    
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    var body: some View {
        VStack {
            Text("Settings")
            Button {
                isLoggedIn = false
            } label: {
                Text("Logout")
            }
        }
    }
}

#Preview {
    Settings()
}

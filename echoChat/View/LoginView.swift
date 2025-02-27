//
//  LoginView.swift
//  echoChat
//
//  Created by Markus Platter on 19.02.25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var loginName: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isLogin: Bool = true
    @State private var userExists: Bool = false
    @State private var loginFailed: Bool = false
    
    @AppStorage("isLoggedIn") private var isLoggedIn:Bool = false
    
    private let authManager = AuthManager()
    private let db = FireStoreDM()
    
    var body: some View {
        if isLoggedIn {
            MainView()
        } else {
            VStack {
                if (isLogin) {
                    VStack {
                        TextField("Loginname", text: $loginName)
                            .padding(10)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        
                        SecureField("Password", text: $password)
                            .padding(10)
                            .textContentType(.password)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                    }
                    .padding()
                } else {
                    VStack {
                        TextField("Loginname (Nur für Login benötigt)", text: $loginName)
                            .padding(10)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        
                        TextField("Username (Sichtbarer Name)", text: $username)
                            .padding(10)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        
                        SecureField("Passwort", text: $password)
                            .padding(10)
                            .textContentType(.password)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        
                        SecureField("Passwort bestätigen", text: $confirmPassword)
                            .padding(10)
                            .textContentType(.password)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                    }
                    .padding()
                }
            }
            if userExists {
                Text("Benutzername existiert bereits.")
                    .foregroundColor(.red)
            }
            if loginFailed {
                Text("Falscher Loginname oder Passwort.")
                    .foregroundColor(.red)
            }
            Button {
                userExists = false
                loginFailed = false
                if isLogin {
                    Task {
                        if await authManager.login(loginName: loginName, password: password) {
                            isLoggedIn = true
                            print("Logged in \(isLoggedIn)")
                        } else {
                            loginFailed = true
                            print("Wrong password oder loginname")
                        }
                    }
                } else {
                    Task {
                        if password == confirmPassword {
                            if await authManager.signUp(loginName: loginName, username: username, password: password) {
                                isLogin = true
                                print("Signed Up")
                            } else {
                                print("Problem to sign up")
                            }
                        }
                    }
                }
            } label: {
                Text(isLogin ? "Login" : "Registrieren")
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(15)
            }
            .padding(.horizontal)
            Button {
                isLogin.toggle()
            } label: {
                Text(!isLogin ? "Login" : "Registrieren")
                    .foregroundColor(.gray)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    LoginView()
}

//
//  AuthModel.swift
//  echoChat
//
//  Created by Markus Platter on 25.02.25.
//
import FirebaseFirestore

class AuthManager {
    
    private var db = Firestore.firestore()
    private var isLoggedIn: Bool = false
    private var isSignedUp: Bool = false
    private let fireStore = FireStoreDM()
    // Hier noch ein EnvironmentObject für den angemeldeten User machen, der in jeder View verfügbar gemacht wird
    
    public func login(loginName: String, password: String) async -> Bool{
        do {
            let snapshot = try await db.collection("users").getDocuments()
            for document in snapshot.documents {
                if document.data()["loginName"] as? String == loginName {
                    let hashPassword = User.hashPassword(password: password, salt: document.data()["salt"] as! Data)
                    if document.data()["password"] as? String == hashPassword {
                        return true
                    } else {
                        isLoggedIn = false
                        
                    }
                } else {
                    isLoggedIn = false
                }
            }
        } catch {
            print("Connection failed")
        }
        return isLoggedIn
    }
    
    public func signUp(loginName: String, username: String, password: String) async -> Bool {
        do {
            let snapshot = try await db.collection("users").getDocuments()
            for document in snapshot.documents {
                if document.data()["loginName"] as? String == loginName {
                    print("LoginName already taken.")
                    isSignedUp = false
                } else {
                    let user = User(username: username, loginName: loginName, password: password)
                    await fireStore.saveUser(user: user)
                    print("User saved.")
                    isSignedUp = true
                }
            }
            
        } catch {
            print("Connection failed")
        }
        return isSignedUp
    }
}

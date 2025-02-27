import FirebaseCore
import FirebaseFirestore

class FireStoreDM {
    // Connection to Firestore
    private let db = Firestore.firestore()
    
    // Method to save a user
    public func saveUser(user: User) async {
        do {
            let snapshot = try await db.collection("users").getDocuments()
            
            let userExists = snapshot.documents.contains { document in
                (document.data()["loginName"] as? String) == user.loginName
            }
            if !userExists {
                try await db.collection("users").document(user.id).setData([
                    "id": user.id,
                    "username": user.username,
                    "loginName": user.loginName,
                    "password": user.password,
                    "salt": user.salt,
                ])
                print("User added successfully with ID: \(user.id)")
            } else {
                print("User with loginName '\(user.loginName)' already exists!")
            }
        } catch {
            print("Error fetching documents: \(error.localizedDescription)")
        }
    }
}

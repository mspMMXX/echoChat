//
//  User.swift
//  echoChat
//
//  Created by Markus Platter on 20.02.25.
//

import Foundation
import CommonCrypto

class User {
    var id: String = UUID().uuidString
    var username: String
    var loginName: String
    var password: String
    var avatar: String?
    var salt: Data
    
    init(username: String, loginName: String, password: String, avatar: String? = nil) {
        self.username = username // Visible name
        self.loginName = loginName // Not visible name - Is used for the authentification in combination with the password
        self.salt = User.generateSalt()
        self.password = User.hashPassword(password: password, salt: salt)
        self.avatar = avatar
    }
    
    static func hashPassword(password: String, salt: Data) -> String {
        let passwordData = password.data(using: .utf8)!
        var derivedKey = [UInt8](repeating: 0, count: 32)

        let saltBytes = [UInt8](salt)
        let passwordBytes = [UInt8](passwordData)

        let status = CCKeyDerivationPBKDF(
            CCPBKDFAlgorithm(kCCPBKDF2),
            passwordBytes, passwordBytes.count,
            saltBytes, saltBytes.count,
            CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA256),
            100_000,
            &derivedKey, derivedKey.count
        )

        guard status == kCCSuccess else {
            fatalError("PBKDF2 failed")
        }
        print(Data(derivedKey).base64EncodedString())
        return Data(derivedKey).base64EncodedString()
    }
    
    static func generateSalt() -> Data {
        var salt = [UInt8](repeating: 0, count: 16)
        let status = SecRandomCopyBytes(kSecRandomDefault, salt.count, &salt)
        guard status == errSecSuccess else { fatalError("Salt generation failed") }
        return Data(salt)
    }
}

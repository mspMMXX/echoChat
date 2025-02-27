//
//  Echo.swift
//  echoChat
//
//  Created by Markus Platter on 20.02.25.
//

import Foundation

class Echo {
    // The name of the Echo
    private var name: String
    // Duration (in seconds) for wich the text message remains visible
    private var textVisibilityTime: TimeInterval
    // Duration (in seconds) for wich the image message remains visible
    private var imageVisibilityTime: TimeInterval
    // Indicates whether the Echo is public or private
    private var echoIsPublic: Bool
    // List of users invited to the Echo
    private var invitedUsers: [User]
    // List of users who have accepted the invitation and joined the Echo
    private var echoUsers: [User] = []
    
    init(name: String, textVisibilityTime: TimeInterval = 3600, imageVisibilityTime: TimeInterval = 3600, echoIsPublic: Bool = false, invitedUsers: [User]) {
        self.name = name
        self.textVisibilityTime = textVisibilityTime
        self.imageVisibilityTime = imageVisibilityTime
        self.invitedUsers = invitedUsers
        self.echoIsPublic = echoIsPublic
    }
}

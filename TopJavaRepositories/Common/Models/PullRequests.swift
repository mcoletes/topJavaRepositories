//
//  PullRequests.swift
//  TopJavaRepositories
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

// MARK: - User
struct PullRequest: Codable {
    let title: String
    let user: User
    let body: String
    
    enum CodingKeys: String, CodingKey {

        case title, user, body
    }
}

// MARK: - User
struct User: Codable {
    let login: String
    let avatarURL: String

    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}

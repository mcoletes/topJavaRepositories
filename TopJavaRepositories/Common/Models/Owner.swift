//
//  Owner.swift
//  TopRatedRepositories
//
//  Created by Mauro Sasso Coletes on 11/04/19.
//  Copyright © 2019 MSC. All rights reserved.
//


import Foundation

struct Owner : Codable {
    
    let avatarUrl : String
    let login : String
    
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case login = "login"
    }
}

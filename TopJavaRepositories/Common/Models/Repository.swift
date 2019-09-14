//
//  Repository.swift
//  TopRatedRepositories
//
//  Created by Mauro Sasso Coletes on 11/04/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

struct Repository : Codable {

        let name : String
        let stargazersCount : Int
        let owner : Owner
        let forks: Int
        let description: String
    
        enum CodingKeys: String, CodingKey {
            
            case name = "name"
            case stargazersCount = "stargazers_count"
            case owner = "owner"
            case forks = "forks"
            case description = "description"
        }
}

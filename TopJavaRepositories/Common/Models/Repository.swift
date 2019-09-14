//
//  Repository.swift
//  TopRatedRepositories
//
//  Created by Mauro Sasso Coletes on 11/04/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

struct Repository : Codable {

        let name : String?
        let stargazersCount : Int? 
        let owner : Owner?
    
        enum CodingKeys: String, CodingKey {
            
            case name = "name"
            case stargazersCount = "stargazers_count"
            case owner = "owner"
        }
    
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            stargazersCount = try values.decodeIfPresent(Int.self, forKey: .stargazersCount)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            owner = try values.decodeIfPresent(Owner.self, forKey: .owner)
        }
}

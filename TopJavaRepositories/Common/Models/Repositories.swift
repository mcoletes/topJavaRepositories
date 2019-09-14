//
//  Repositories.swift
//  TopRatedRepositories
//
//  Created by Mauro Sasso Coletes on 11/04/19.
//  Copyright © 2019 MSC. All rights reserved.
//


import Foundation

struct Repositories : Codable {

        let items : [Repository]?

        enum CodingKeys: String, CodingKey {
                case items = "items"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                items = try values.decodeIfPresent([Repository].self, forKey: .items)
        }
}

//
//  PullRequestRepoProvider.swift
//  TopJavaRepositories
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

class PullRequestRepoProvider: URLRequestProtocol {
    
    var owner: String
    var name: String
    
    var httpMethod: HTTPMethod = .get

    init(owner: String, name: String) {
        self.owner = owner
        self.name = name
    }
    
    func path() -> String {
        return "/repos/\(owner)/\(name)/pulls"
    }
}

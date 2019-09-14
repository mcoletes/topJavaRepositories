//
//  TopJavaRepositoriesProvider.swift
//  TopJavaRepositories
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

class TopJavaRepositoriesProvider: URLRequestProtocol {
    
    init(page: Int = 0) {
        self.page = page
    }
    
    var page: Int
    
    var path: String = "/search/repositories"
    
    var httpMethod: HTTPMethod = .get
    
    func urlParameters() -> [URLQueryItem] {
        
        return [URLQueryItem(name: "q", value: "language:Java"), URLQueryItem(name: "sort", value: "stars"),URLQueryItem(name: "per_page", value: "30"), URLQueryItem(name: "page", value: "\(page)")]
    }
}

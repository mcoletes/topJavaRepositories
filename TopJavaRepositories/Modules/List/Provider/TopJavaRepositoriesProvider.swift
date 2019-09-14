//
//  TopJavaRepositoriesProvider.swift
//  TopJavaRepositories
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

class TopJavaRepositoriesProvider: URLRequestProtocol {

    var page: Int
    var httpMethod: HTTPMethod = .get
    
    init(page: Int = 0) {
        self.page = page
    }
    
    func path() -> String {
        return "/search/repositories"
    }
       
    func urlParameters() -> [URLQueryItem] {
        
        return [URLQueryItem(name: "q", value: "language:Java"), URLQueryItem(name: "sort", value: "stars"),URLQueryItem(name: "per_page", value: "30"), URLQueryItem(name: "page", value: "\(page)")]
    }
}

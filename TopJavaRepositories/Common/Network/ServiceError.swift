//
//  ServiceError.swift
//  TopRatedRepositories
//
//  Created by Mauro Sasso Coletes on 11/04/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case requestFailed
    case jsonParsingFailure
    case responseUnsuccessful(statusCode: Int)
    
    var localizedDescription: String {
        switch self {
        case .requestFailed:
            return "Request Failed"
        case .jsonParsingFailure:
            return "JSON Parsing Failure"
        case .responseUnsuccessful:
            return "Response Unsuccessful"
        }
    }
}

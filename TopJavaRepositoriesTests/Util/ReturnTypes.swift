//
//  ReturnTypes.swift
//  TopJavaRepositoriesTests
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

enum ReturnTypes {
    case requestFailed
    case jsonParsingFailure
    case responseUnsuccessful(statusCode: Int)
    case success
}

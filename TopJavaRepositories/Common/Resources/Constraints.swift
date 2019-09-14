//
//  Constraints.swift
//  TopRatedRepositories
//
//  Created by Mauro Sasso Coletes on 15/04/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import UIKit

public enum DefaultConstraints: String, CaseIterable {
    
    case main
    case large
    case small
    
    public var spacing: CGFloat {
        switch self {
        case .main:
            return 16
        case .large:
            return 32
        case .small:
            return 8
        }
    }
}


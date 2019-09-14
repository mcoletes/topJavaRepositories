//
//  Colors.swift
//  TopRatedRepositories
//
//  Created by Mauro Sasso Coletes on 15/04/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import UIKit

public enum PrimaryColors: String, CaseIterable {
    
    case main
    case light
    case dark
    
    public var color: UIColor {
        switch self {
        case .main:
            return .black
        case .light:
            return .gray
        case .dark:
            return .darkGray
        }
    }
}

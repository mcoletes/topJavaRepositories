//
//  Font.swift
//  TopRatedRepositories
//
//  Created by Mauro Sasso Coletes on 15/04/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import UIKit

public enum DefaultFont: String, CaseIterable {
    
    case large
    case medium
    case small
    
    public var font: UIFont {
        switch self {
        case .large:
            return UIFont.systemFont(ofSize: 18, weight: .bold)
        case .medium:
            return UIFont.systemFont(ofSize: 16, weight: .semibold)
        case .small:
           return UIFont.systemFont(ofSize: 18, weight: .light)
        }
    }
}

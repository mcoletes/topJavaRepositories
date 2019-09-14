//
//  ENV.swift
//  TopRatedRepositories
//
//  Created by Mauro Sasso Coletes on 12/04/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

public enum PlistKey {
    case productURL

    
    func value() -> String {
        switch self {
        case .productURL:
            return "product_url"
        }
    }
}
public struct ENV {
    
    fileprivate static var infoDict: [String: Any] {
        if let dict = Bundle.main.infoDictionary {
            return dict
        } else {
            fatalError("Plist file not found")
        }
    }
    
    public static func value(_ key: PlistKey) -> String {
        guard let value = infoDict[key.value()] as? String else {
            return ""
        }
        
        switch key {
        case .productURL:
            return "https://\(value)"
        }
    }
    
    public static func double( _ key: PlistKey) -> Double {
        guard let value = infoDict[key.value()] as? Double else {
            return 0
        }
        return value
    }
}

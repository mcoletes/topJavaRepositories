//
//  JsonLoader.swift
//  TopJavaRepositoriesTests
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

class JsonLoader {
    func loadFromJsonFile<T: Decodable>(jsonFileName: String) -> T? {
        let testBundle = Bundle(for: type(of: self))
        if let path = testBundle.path(forResource: jsonFileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let model = try JSONDecoder().decode(T.self, from: data)
                return model
            } catch {
                return nil
            }
        }
        return nil
    }
}


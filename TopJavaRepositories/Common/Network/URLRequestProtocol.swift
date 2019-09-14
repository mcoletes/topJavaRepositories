//
//  URLRequestProtocol.swift
//  TopRatedRepositories
//
//  Created by Mauro Sasso Coletes on 11/04/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

// MARK: - Protocol

protocol URLRequestProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    func headers() -> [String: String]
    func urlParameters() -> [URLQueryItem]
    func bodyParameters() -> [String: Any]
    var timeOut: TimeInterval { get }
    
    func asURLRequest() -> URLRequest
}

extension URLRequestProtocol {
    
    var baseURL: URL {
        return URL(string: ENV.value(.productURL))!
    }
    func headers() -> [String: String] {
        return [:]
    }
    func urlParameters() -> [URLQueryItem] {
        return []
    }
    func bodyParameters() -> [String: Any] {
        return [:]
    }
    var timeOut: TimeInterval {
        return 30
    }
    
    // MARK: - Instance Methods
    
    public func asURLRequest() -> URLRequest {
        let fullURL = baseURL.appendingPathComponent(path)
        
        var urlComponents = URLComponents(url: fullURL, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = urlParameters()
        
        var urlRequest = URLRequest(url: urlComponents?.url ?? fullURL)
        
        if !bodyParameters().isEmpty {
            let httpBodyParameters = try? JSONSerialization.data(withJSONObject: bodyParameters, options: [])
            urlRequest.httpBody = httpBodyParameters
        }
        
        headers().forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.timeoutInterval = timeOut
        
        return urlRequest
    }
}

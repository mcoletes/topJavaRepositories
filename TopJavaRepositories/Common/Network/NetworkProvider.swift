//
//  NetworkProvider.swift
//  TopRatedRepositories
//
//  Created by Mauro Sasso Coletes on 11/04/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

class NetworkProvider {
    
    // MARK: - Properties
    
    var route: URLRequestProtocol
    
    private let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30
        
        return config
    }()
    
    // MARK: - Init
    
    public init(route: URLRequestProtocol) {
        self.route = route
    }
    
    @discardableResult
    open func fetch<T: Decodable>(onSuccess: @escaping (T) -> Void, onError: @escaping (ServiceError) -> Void) -> URLSessionDataTask {
        let session = URLSession(configuration: configuration).dataTask(with: route.asURLRequest()) { data, response, error in
            self.handleDecodableResponse(data: data, response: response, error: error, onSuccess: onSuccess, onError: onError)
        }
        session.resume()
        
        return session
    }
    
    func handleDecodableResponse<T: Decodable>(data: Data?,
                                               response: URLResponse?,
                                               error: Error?,
                                               onSuccess: ((T) -> Void),
                                               onError: ((ServiceError) -> Void)) {
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            onError(ServiceError.requestFailed)
            return
        }
        
        guard isSucess(statusCode) else {
            onError(ServiceError.responseUnsuccessful(statusCode: statusCode))
            return
        }
        
        if let data = data {
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                onSuccess(model)
                return
            }
            catch {
                onError(ServiceError.jsonParsingFailure)
                return
            }
        }
    }
    
    private func isSucess(_ statusCode: Int) -> Bool {
        return 200..<300 ~= statusCode
    }
}

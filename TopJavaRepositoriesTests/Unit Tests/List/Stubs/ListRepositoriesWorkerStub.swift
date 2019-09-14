//
//  ListRepositoriesWorkerStub.swift
//  TopJavaRepositoriesTests
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

@testable import TopJavaRepositories

class TopRatedRpositoriesWorkerStub: ListRepositoriesWorker {
    var returnTypes: ReturnTypes = .success
    
    override func fetchJavaRepositories(request: ListRepositories.Request, onSuccess: @escaping (Repositories) -> Void, onError: @escaping (ServiceError) -> Void) {
        switch returnTypes {
        case .success:
            if let repositories: Repositories = JsonLoader().loadFromJsonFile(jsonFileName: "topRepositories"){
                onSuccess(repositories)
            }
        case .requestFailed:
            onError(ServiceError.requestFailed)
        case .jsonParsingFailure:
            onError(ServiceError.jsonParsingFailure)
        case .responseUnsuccessful(_):
            onError(ServiceError.responseUnsuccessful(statusCode: 500))
        }
    }
}

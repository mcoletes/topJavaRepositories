//
//  PullRequestRepoWorkerStub.swift
//  TopJavaRepositoriesTests
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

@testable import TopJavaRepositories

class PullRequestRepoWorkerStub: PullRequestRepoWorker {
    var returnTypes: ReturnTypes = .success
    
   override func getPullRequests(request: PullRequestRepo.Request, onSuccess: @escaping ([PullRequest]) -> Void, onError: @escaping (ServiceError) -> Void) {
        switch returnTypes {
        case .success:
            if let pullRequests: [PullRequest] = JsonLoader().loadFromJsonFile(jsonFileName: "pullRequests"){
                onSuccess(pullRequests)
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

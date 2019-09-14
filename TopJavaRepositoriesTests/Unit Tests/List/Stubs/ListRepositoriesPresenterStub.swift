//
//  ListRepositoriesPresenterStub.swift
//  TopJavaRepositoriesTests
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

@testable import TopJavaRepositories
import Foundation

class listRepositoriesPresentationLogicSpy: ListRepositoriesPresentationLogic {
    var invokedReloadTable = false
    var invokedReloadTableCount = 0
    func reloadTable() {
        invokedReloadTable = true
        invokedReloadTableCount += 1
    }
    var invokedDisplayError = false
    var invokedDisplayErrorCount = 0
    var invokedDisplayErrorParameters: (type: ListRepositories.errors, Void)?
    var invokedDisplayErrorParametersList = [(type: ListRepositories.errors, Void)]()
    var shouldInvokeDisplayErrorTryAgainAction = false
    func displayError(type: ListRepositories.errors, tryAgainAction: EmptyClosure?) {
        invokedDisplayError = true
        invokedDisplayErrorCount += 1
        invokedDisplayErrorParameters = (type, ())
        invokedDisplayErrorParametersList.append((type, ()))
        if shouldInvokeDisplayErrorTryAgainAction {
            _ = tryAgainAction?()
        }
    }
    var invokedPresentViewModelFromModel = false
    var invokedPresentViewModelFromModelCount = 0
    var invokedPresentViewModelFromModelParameters: (repository: Repository, Void)?
    var invokedPresentViewModelFromModelParametersList = [(repository: Repository, Void)]()
    var stubbedPresentViewModelFromModelResult: ListRepositories.ViewModel!
    func presentViewModelFromModel(repository: Repository) -> ListRepositories.ViewModel? {
        invokedPresentViewModelFromModel = true
        invokedPresentViewModelFromModelCount += 1
        invokedPresentViewModelFromModelParameters = (repository, ())
        invokedPresentViewModelFromModelParametersList.append((repository, ()))
        guard let url = URL(string: repository.owner.avatarUrl) else {
            return nil
        }
        return ListRepositories.ViewModel(name: repository.name, stars: repository.stargazersCount, ownerName: repository.owner.login, ownerPhotoURL: url, forks: repository.forks, description: repository.description)
    }
    var invokedPresentRepositoryPullRequests = false
    var invokedPresentRepositoryPullRequestsCount = 0
    func presentRepositoryPullRequests() {
        invokedPresentRepositoryPullRequests = true
        invokedPresentRepositoryPullRequestsCount += 1
    }
}

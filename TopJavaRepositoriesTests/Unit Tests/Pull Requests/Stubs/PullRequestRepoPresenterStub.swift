//
//  PullRequestRepoPresenterStub.swift
//  TopJavaRepositoriesTests
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

@testable import TopJavaRepositories
import Foundation

class PullRequestRepoPresenterStub: PullRequestRepoPresenter {
    var invokedViewControllerSetter = false
    var invokedViewControllerSetterCount = 0
    var invokedViewController: PullRequestRepoDisplayLogic?
    var invokedViewControllerList = [PullRequestRepoDisplayLogic?]()
    var invokedViewControllerGetter = false
    var invokedViewControllerGetterCount = 0
    var stubbedViewController: PullRequestRepoDisplayLogic!
    override var viewController: PullRequestRepoDisplayLogic? {
        set {
            invokedViewControllerSetter = true
            invokedViewControllerSetterCount += 1
            invokedViewController = newValue
            invokedViewControllerList.append(newValue)
        }
        get {
            invokedViewControllerGetter = true
            invokedViewControllerGetterCount += 1
            return stubbedViewController
        }
    }
    var invokedDisplayError = false
    var invokedDisplayErrorCount = 0
    var invokedDisplayErrorParameters: (type: ListRepositories.errors, Void)?
    var invokedDisplayErrorParametersList = [(type: ListRepositories.errors, Void)]()
    var shouldInvokeDisplayErrorTryAgainAction = false
    override func displayError(type: ListRepositories.errors, tryAgainAction: EmptyClosure?) {
        invokedDisplayError = true
        invokedDisplayErrorCount += 1
        invokedDisplayErrorParameters = (type, ())
        invokedDisplayErrorParametersList.append((type, ()))
        if shouldInvokeDisplayErrorTryAgainAction {
            _ = tryAgainAction?()
        }
    }
    var invokedReloadTable = false
    var invokedReloadTableCount = 0
    override func reloadTable() {
        invokedReloadTable = true
        invokedReloadTableCount += 1
    }
    var invokedPresentViewModelFromModel = false
    var invokedPresentViewModelFromModelCount = 0
    var invokedPresentViewModelFromModelParameters: (pullRequest: PullRequest, Void)?
    var invokedPresentViewModelFromModelParametersList = [(pullRequest: PullRequest, Void)]()
    var stubbedPresentViewModelFromModelResult: PullRequestRepo.ViewModel!
    override func presentViewModelFromModel(pullRequest: PullRequest) -> PullRequestRepo.ViewModel? {
        invokedPresentViewModelFromModel = true
        invokedPresentViewModelFromModelCount += 1
        invokedPresentViewModelFromModelParameters = (pullRequest, ())
        invokedPresentViewModelFromModelParametersList.append((pullRequest, ()))
        guard let url = URL(string: pullRequest.user.avatarURL) else {
            return nil
        }
        return PullRequestRepo.ViewModel(title: pullRequest.title, body: pullRequest.body, ownerName: pullRequest.user.login, ownerPhotoURL: url)
    }
    var invokedPresentLoading = false
    var invokedPresentLoadingCount = 0
    override func presentLoading() {
        invokedPresentLoading = true
        invokedPresentLoadingCount += 1
    }
    var invokedHideLoading = false
    var invokedHideLoadingCount = 0
    override func hideLoading() {
        invokedHideLoading = true
        invokedHideLoadingCount += 1
    }
    var invokedPresentTitle = false
    var invokedPresentTitleCount = 0
    var invokedPresentTitleParameters: (title: String, Void)?
    var invokedPresentTitleParametersList = [(title: String, Void)]()
    override func presentTitle(title: String) {
        invokedPresentTitle = true
        invokedPresentTitleCount += 1
        invokedPresentTitleParameters = (title, ())
        invokedPresentTitleParametersList.append((title, ()))
    }
}


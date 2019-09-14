//
//  ListRepositoriesPresenter.swift
//  TopJavaRepositories
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright (c) 2019 MSC. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
// This tag below is used to create the testable files from the Cuckoo pod
// CUCKOO_TESTABLE

import UIKit

protocol ListRepositoriesPresentationLogic {
    func reloadTable()
    func displayError(type: ListRepositories.errors, tryAgainAction: EmptyClosure?)
    func presentViewModelFromModel(repository: Repository) -> ListRepositories.ViewModel?
    func presentRepositoryPullRequests()
}

class ListRepositoriesPresenter: ListRepositoriesPresentationLogic {
    
    weak var viewController: ListRepositoriesDisplayLogic?

    func reloadTable() {
        viewController?.reloaTable()
    }
    
    func displayError(type: ListRepositories.errors, tryAgainAction: EmptyClosure?) {
        switch type {
        case .noInternet:
            viewController?.displayError(message: R.string.topRatedJavaRepositories.noInternetConnectionMessage(), actionButtonTitle: nil, tryAgainAction: nil)
        default:
            viewController?.displayError(message: R.string.topRatedJavaRepositories.tryAgainMessage(), actionButtonTitle: R.string.topRatedJavaRepositories.tryAgainActionTitle(), tryAgainAction: tryAgainAction)
        }
    }
    
    func presentViewModelFromModel(repository: Repository) -> ListRepositories.ViewModel? {
        guard let url = URL(string: repository.owner.avatarUrl) else {
            return nil
        }
        return ListRepositories.ViewModel(name: repository.name, stars: repository.stargazersCount, ownerName: repository.owner.login, ownerPhotoURL: url, forks: repository.forks, description: repository.description)
    }
    
    func presentRepositoryPullRequests() {
        viewController?.showRepositoryPullRequests()
    }
}

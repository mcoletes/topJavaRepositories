//
//  ListRepositoriesInteractor.swift
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

protocol ListRepositoriesBusinessLogic {
    func fetchRepositories()
    func numbeOfRows() -> Int
    func viewModelForIndex(index: Int) -> ListRepositories.ViewModel?
    func loadNextPageIfNeeded(for index: Int)
}

protocol ListRepositoriesDataStore {
    var currentPage: Int { get set }
}

class ListRepositoriesInteractor: ListRepositoriesBusinessLogic, ListRepositoriesDataStore {

    var presenter: ListRepositoriesPresentationLogic?
    let worker: ListRepositoriesWorker

    var items: [Repository] = []
    var currentPage: Int = 1
    var pageSize: Int = 30
    
    init(worker: ListRepositoriesWorker = ListRepositoriesWorker()) {
        self.worker = worker
    }
    
    // MARK: Do something
    
    func fetchRepositories() {
        let request = ListRepositories.Request(page: currentPage)
        worker.fetchJavaRepositories(request: request, onSuccess: { (repositories) in
            if let repoItems = repositories.items {
                self.items.append(contentsOf: repoItems)
            }
            self.presenter?.reloadTable()
        }, onError: { (error) in
            switch error {
            case .requestFailed:
                self.presenter?.displayError(type: ListRepositories.errors.noInternet, tryAgainAction: nil)
            case .jsonParsingFailure, .responseUnsuccessful(statusCode: _):
                self.presenter?.displayError(type: ListRepositories.errors.tryAgain, tryAgainAction: self.fetchRepositories)
            }
        })
    }
    
    func numbeOfRows() -> Int {
        return self.items.count
    }
    
    func viewModelForIndex(index: Int) -> ListRepositories.ViewModel? {
        guard index >= 0 && index < numbeOfRows() else { return nil }
        return presenter?.presentViewModelFromModel(repository: items[index])
    }
    
    func loadNextPageIfNeeded(for index: Int) {
        
        let targetCount = currentPage < 0 ? 1 : currentPage * pageSize - 10
        guard index == targetCount else {
            return
        }
        currentPage += 1
        fetchRepositories()
    }
}
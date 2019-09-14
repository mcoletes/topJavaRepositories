//
//  ListRepositoriesInteractorTest.swift
//  TopJavaRepositoriesTests
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Quick
import Nimble
@testable import TopJavaRepositories

class ListRepositoriesInteractorTest: QuickSpec {
    override func spec() {
        
        describe("TopRatedRepositoriesInteractorTests") {
            
            
            var interactor: ListRepositoriesInteractor!
            var presenter: listRepositoriesPresentationLogicSpy!
            var worker: TopRatedRpositoriesWorkerStub!
            
            beforeEach {
                worker = TopRatedRpositoriesWorkerStub()
                interactor = ListRepositoriesInteractor(worker: worker)
                presenter = listRepositoriesPresentationLogicSpy()
                interactor.presenter = presenter
            }
            
            it("success return from top repositories first page") {
                worker.returnTypes = .success
                interactor.fetchRepositories()
                
                expect(presenter.invokedReloadTable).to(equal(true))
                expect(interactor.numbeOfRows()).to(equal(30))
                
                expect(interactor.viewModelForIndex(index: 0)?.name).to(equal("awesome-ios"))
            }
            
            it("error return from top repositories") {
                worker.returnTypes = .requestFailed
                interactor.fetchRepositories()
                
                expect(interactor.numbeOfRows()).to(equal(0))
                expect(presenter.invokedDisplayError).to(equal(true))
                
                worker.returnTypes = .jsonParsingFailure
                interactor.fetchRepositories()
                
                expect(interactor.numbeOfRows()).to(equal(0))
                expect(presenter.invokedDisplayError).to(equal(true))
                
                worker.returnTypes = .responseUnsuccessful(statusCode: 500)
                interactor.fetchRepositories()
                
                expect(interactor.numbeOfRows()).to(equal(0))
                expect(presenter.invokedDisplayError).to(equal(true))
                
            }
            
            it("should load more pages") {
                worker.returnTypes = .success
                interactor.fetchRepositories()
                
                expect(presenter.invokedReloadTable).to(equal(true))
                expect(interactor.numbeOfRows()).to(equal(30))
                
                expect(interactor.viewModelForIndex(index: 0)?.name).to(equal("awesome-ios"))
                
                interactor.loadNextPageIfNeeded(for: 20)
                expect(interactor.currentPage).to(equal(2))
                expect(interactor.numbeOfRows()).to(equal(60))
            }
            
            it("should not load more pages") {
                worker.returnTypes = .success
                interactor.fetchRepositories()
                
                expect(presenter.invokedReloadTable).to(equal(true))
                expect(interactor.numbeOfRows()).to(equal(30))
                
                interactor.loadNextPageIfNeeded(for: 5)
                expect(interactor.currentPage).to(equal(1))
                expect(interactor.numbeOfRows()).to(equal(30))
            }
            
            it("did select a repository to display pull request") {
                worker.returnTypes = .success
                interactor.fetchRepositories()
                
                interactor.didSelectRow(index: 10)
                expect(presenter.invokedPresentRepositoryPullRequests).to(equal(true))
            }
        }
    }
}


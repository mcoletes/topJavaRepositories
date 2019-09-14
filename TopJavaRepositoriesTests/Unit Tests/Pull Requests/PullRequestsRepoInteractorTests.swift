//
//  PullRequestsRepoInteractorTests.swift
//  TopJavaRepositoriesTests
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//


import Quick
import Nimble
@testable import TopJavaRepositories

class PullRequestsRepoInteractorTests: QuickSpec {
    override func spec() {
        
        describe("PullRequestsRepoInteractorTests") {
            
            
            var interactor: PullRequestRepoInteractor!
            var presenter: PullRequestRepoPresenterStub!
            var worker: PullRequestRepoWorkerStub!
            
            beforeEach {
                worker = PullRequestRepoWorkerStub()
                interactor = PullRequestRepoInteractor(worker: worker)
                presenter = PullRequestRepoPresenterStub()
                interactor.presenter = presenter
                interactor.name = "test"
                interactor.owner = "testOwner"
            }
            
            it("success return from pull requests") {
                worker.returnTypes = .success
                interactor.getPullrequests()
                
                expect(presenter.invokedReloadTable).to(equal(true))
                expect(interactor.numbeOfRows()).to(equal(10))
                
                expect(interactor.viewModelForIndex(index: 0)?.title).to(equal("modify the description"))
            }
            
            it("error return from pull requests") {
                worker.returnTypes = .requestFailed
                interactor.getPullrequests()

                expect(interactor.numbeOfRows()).to(equal(0))
                expect(presenter.invokedDisplayError).to(equal(true))

                worker.returnTypes = .jsonParsingFailure
                interactor.getPullrequests()

                expect(interactor.numbeOfRows()).to(equal(0))
                expect(presenter.invokedDisplayError).to(equal(true))

                worker.returnTypes = .responseUnsuccessful(statusCode: 500)
                interactor.getPullrequests()

                expect(interactor.numbeOfRows()).to(equal(0))
                expect(presenter.invokedDisplayError).to(equal(true))

            }
            
            it("display title") {
                interactor.getTitle()
                expect(presenter.invokedPresentTitle).to(equal(true))
            }
        }
    }
}


//
//  ListRepositoriesViewControllerTests.swift
//  TopJavaRepositoriesTests
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//


import Quick
import Nimble
import Nimble_Snapshots

@testable import TopJavaRepositories

class ListRepositoriesViewControllerTests: QuickSpec {
    
    override func spec() {
        
        describe("ListRepositoriesViewControllerTests") {
            
            var vc: ListRepositoriesViewController!
            var presenter: ListRepositoriesPresenter!
            var interactor: ListRepositoriesInteractor!
            var worker: TopRatedRpositoriesWorkerStub!
            beforeEach {
                vc = ListRepositoriesViewController()
                vc.view.translatesAutoresizingMaskIntoConstraints = false
                let window = UIWindow(frame: UIScreen.main.bounds)
                window.makeKeyAndVisible()
                window.rootViewController = vc
                presenter = ListRepositoriesPresenter()
                presenter.viewController = vc
                worker = TopRatedRpositoriesWorkerStub()
                interactor = ListRepositoriesInteractor(worker: worker)
                interactor.presenter = presenter
                vc.interactor = interactor
                vc.viewDidAppear(true)
            }
            afterEach {
                vc = nil
                presenter = nil
                interactor = nil
            }
            
            it("should present loading state") {
                expect(vc) == snapshot()
            }
            it("should display top 30 repositories") {
                interactor.fetchRepositories()
                expect(interactor.numbeOfRows()).to(equal(30))
                expect(interactor.items.first?.name).to(equal("awesome-ios"))
                expect(vc) == snapshot()
            }
            
            it("should display error message") {
                worker.returnTypes = .requestFailed
                interactor.fetchRepositories()
                expect(interactor.numbeOfRows()).to(equal(0))
                expect(vc) == snapshot("failed request")
                worker.returnTypes = .responseUnsuccessful(statusCode: 500)
                interactor.fetchRepositories()
                expect(vc) == snapshot("error request with try again action")
            }
        }
    }
}


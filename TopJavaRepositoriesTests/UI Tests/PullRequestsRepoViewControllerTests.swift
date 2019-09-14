//
//  PullRequestsRepoViewControllerTests.swift
//  TopJavaRepositoriesTests
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import TopJavaRepositories

class PullRequestsRepoViewControllerTests: QuickSpec {
    
    override func spec() {
        
        describe("PullRequestsRepoViewControllerTests") {
            
            var vc: PullRequestRepoViewController!
            var presenter: PullRequestRepoPresenter!
            var interactor: PullRequestRepoInteractor!
            var worker: PullRequestRepoWorkerStub!
            beforeEach {
                vc = PullRequestRepoViewController()
                vc.view.translatesAutoresizingMaskIntoConstraints = false
                let window = UIWindow(frame: UIScreen.main.bounds)
                window.makeKeyAndVisible()
                window.rootViewController = vc
                presenter = PullRequestRepoPresenter()
                presenter.viewController = vc
                worker = PullRequestRepoWorkerStub()
                interactor = PullRequestRepoInteractor(worker: worker)
                interactor.presenter = presenter
                vc.interactor = interactor
                vc.viewDidAppear(true)
                interactor.name = "test"
                interactor.owner = "testOwner"
            }
            afterEach {
                vc = nil
                presenter = nil
                interactor = nil
            }
            
            it("should present loading state") {
                expect(vc) == snapshot()
            }
            it("should display pull requests") {
                worker.returnTypes = .success
                interactor.getPullrequests()
                expect(interactor.numbeOfRows()).to(equal(10))
                expect(interactor.items.first?.title).to(equal("modify the description"))
                expect(vc) == snapshot()
            }
        }
    }
}



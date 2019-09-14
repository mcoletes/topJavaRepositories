//
//  ListRepositoriesViewController.swift
//  TopJavaRepositories
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright (c) 2019 MSC. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListRepositoriesDisplayLogic: class, ViewControllerBaseProtocol {
        func reloaTable()
}

class ListRepositoriesViewController: UIViewController {

    var interactor: ListRepositoriesBusinessLogic?
    var router: (ListRepositoriesRoutingLogic & ListRepositoriesDataPassing)?

    @IBOutlet weak var tableView: UITableView!
    
    init() {
        super.init(nibName: "ListRepositoriesViewController", bundle: Bundle(for: ListRepositoriesViewController.self))
        setup()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        let viewController = self
        let interactor = ListRepositoriesInteractor()
        let presenter = ListRepositoriesPresenter()
        let router = ListRepositoriesRouter()
        viewController.interactor = interactor
        viewController.router = router
        presenter.viewController = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        router.dataStore = interactor
        
        self.title = R.string.topRatedJavaRepositories.topRepositoriesTitle()
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        interactor?.fetchRepositories()
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func configureTableView() {
        addSpinnerToFooteTableView()
        tableView.prefetchDataSource = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func addSpinnerToFooteTableView(){
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
        
        tableView.tableFooterView = spinner
        tableView.tableFooterView?.isHidden = false
    }

}

extension ListRepositoriesViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.numbeOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListRepositoriesCell = tableView.dequeueReusableCell(for: indexPath)
        if let item = interactor?.viewModelForIndex(index: indexPath.row) {
//            cell.configure(name: item.name, stars: "\(item.stars)", ownerName: item.ownerName, ownerImageURL: item.ownerPhotoURL)
            return cell
        }
        return UITableViewCell()
        
    }
}

extension ListRepositoriesViewController: ListRepositoriesDisplayLogic {
    func reloaTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ListRepositoriesViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            interactor?.loadNextPageIfNeeded(for: indexPath.row)
        }
    }
}
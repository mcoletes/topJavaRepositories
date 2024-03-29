//
//  ListRepositoriesWorker.swift
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

import Foundation
//import PromiseKit

class ListRepositoriesWorker {

    func fetchJavaRepositories(request: ListRepositories.Request, onSuccess: @escaping (Repositories) -> Void, onError: @escaping (ServiceError) -> Void) {
        let topRatedRepositoriesProvider = TopJavaRepositoriesProvider(page: request.page)
        NetworkProvider(route: topRatedRepositoriesProvider).fetch(onSuccess: onSuccess, onError: onError)
    }
}

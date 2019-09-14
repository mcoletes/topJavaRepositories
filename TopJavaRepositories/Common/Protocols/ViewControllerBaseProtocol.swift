//
//  ViewControllerBaseProtocol.swift
//  TopRatedRepositories
//
//  Created by Mauro Sasso Coletes on 12/04/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import UIKit

protocol ConfigureViewsLayoutProtocol {
    func configureViewsHierarchy()
    func configureViewsConstraints()
}

protocol ViewControllerBaseProtocol {
    func displayError(message: String, actionButtonTitle: String?, tryAgainAction: EmptyClosure?)
}

extension ViewControllerBaseProtocol where Self: UIViewController  {
    func displayError(message: String, actionButtonTitle: String?, tryAgainAction: EmptyClosure?) {
        let alertController = UIAlertController(title: R.string.topRatedJavaRepositories.warningTitle(), message: message, preferredStyle: .alert)

        if let action = tryAgainAction {
            let okAction = UIAlertAction(title: actionButtonTitle, style: .default) {
                UIAlertAction in
               action()
            }
             alertController.addAction(okAction)
        }

        let cancelAction = UIAlertAction(title: R.string.topRatedJavaRepositories.okActionTitle(), style: .cancel)

        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
    }
}


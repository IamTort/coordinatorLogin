//  UIViewController+Extension.swift
//  coordinatorLogin
//  Created by angelina on 28.12.2022.

import UIKit

/// Расширение для универсального алерта
extension UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let actionTitle = "ok"
    }

    // MARK: - Public methods

    func showErrorAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message:
            message,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: Constants.actionTitle, style: .cancel, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}

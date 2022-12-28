//  MainPageViewController.swift
//  coordinatorLogin
//  Created by angelina on 28.12.2022.

import UIKit

/// Экран с привествием
final class MainPageViewController: UIViewController, Storyboarded {

    // MARK: - Constants

    private enum Constants {
        static let helloString = "Hello,"
        static let keyString = "isLogin"
    }
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = "\(Constants.helloString) \(nameString)"
        }
    }
    
    // MARK: - Public property
    weak var coordinator: MainCoordinator?
    var nameString = String()
    
    // MARK: - Private IBAction
    @IBAction private func logoutAction(_ sender: Any) {
        guard let coordinator = coordinator else {
            return
        }
        
        UserDefaults.standard.set(false, forKey: Constants.keyString)
        coordinator.logout()
    }
}

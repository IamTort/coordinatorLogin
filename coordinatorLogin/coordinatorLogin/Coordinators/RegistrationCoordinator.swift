//
//  RegisterCoordinator.swift
//  coordinatorLogin
//
//  Created by angelina on 28.12.2022.
//

import UIKit
/// Координатор экрана регистрации
final class RegistrationCoordinator: Coordinator {
    
    // MARK: - Public property
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Public methods
   
    func start() {
        let vc = RegistrationViewController.instantiate()
        vc.toHelloUser = { [weak self] name in
                self?.login(name: name)
        }
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func login(name: String) {
        let vc = MainPageViewController.instantiate()
        vc.nameString = name
        vc.coordinator = parentCoordinator
        navigationController.pushViewController(vc, animated: true)
    }
}

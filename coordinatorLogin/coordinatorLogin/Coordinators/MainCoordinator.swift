//  MainCoordinator.swift
//  coordinatorLogin
//  Created by angelina on 28.12.2022.

import UIKit

/// Главный координатор
final class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    // MARK: - Constants
    private enum Constants {
        static let keyString = "isLogin"
        static let loginString = "q"
    }
    
    // MARK: - Public property
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Public methods
    
    func start() {
        navigationController.delegate = self
        if UserDefaults.standard.bool(forKey: Constants.keyString) {
            login(name: Constants.loginString)
        } else {
            let vc = LoginViewController.instantiate()
            vc.toHelloUser = { [weak self] name in
                self?.login(name: name)
            }
            vc.coordinator = self
            navigationController.pushViewController(vc, animated: false)
        }
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        if let registrationViewController = fromViewController as? RegistrationViewController {
            childDidFinish(registrationViewController.coordinator)
        }
    }
    
    func goRegistration() {
        let child = RegistrationCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    func login(name: String) {
        let vc = MainPageViewController.instantiate()
        vc.nameString = name
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func logout() {
        let vc = MainPageViewController.instantiate()
        vc.coordinator = self
        navigationController.popViewController(animated: true)
    }
}


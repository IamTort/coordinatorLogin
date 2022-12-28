//  Coordinator.swift
//  coordinatorLogin
//  Created by angelina on 28.12.2022.

import UIKit

/// Протокол для координатора
protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

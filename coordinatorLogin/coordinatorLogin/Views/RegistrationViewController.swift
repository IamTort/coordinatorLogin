//  RegistrationViewController.swift
//  coordinatorLogin
//  Created by angelina on 28.12.2022.

import UIKit

/// Экран регистрации
final class RegistrationViewController: UIViewController, Storyboarded {
    
    // MARK: - Constants
    
    private enum Constants {
        static let mistakeString = "Ошибка"
        static let mistakeMessageString = "Все поля должны быть заполнены!"
        static let keyString = "isLogin"
    }
    
    // MARK: - Private IBOutlet
    
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Public property
    
    weak var coordinator: RegistrationCoordinator?
    var toHelloUser: StringHandler?
    
    // MARK: - Private IBAction
    
    @IBAction private func registerAction(_ sender: Any) {
        guard
            let login = loginTextField.text,
            let _ = passwordTextField.text else {
            showErrorAlert(title: Constants.mistakeString, message: Constants.mistakeMessageString)
            return }
        UserDefaults.standard.set(true, forKey: Constants.keyString)
        toHelloUser?(login)
    }
    
}

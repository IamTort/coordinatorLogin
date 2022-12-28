//  ViewController.swift
//  coordinatorLogin
//  Created by angelina on 28.12.2022.

import UIKit

typealias StringHandler = (String) -> Void
/// Экран входа
final class LoginViewController: UIViewController, Storyboarded {

    // MARK: - Constants
    private enum Constants {
        static let mistakeString = "Ошибка"
        static let mistakeMessageString = "Нет пользователя с таким логином и паролем"
        static let keyString = "isLogin"
        static let loginString = "q"
        static let passwordString = "1"
    }
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Public property
    weak var coordinator: MainCoordinator?
    var toHelloUser: StringHandler?
    
    // MARK: - Private IBAction
    
    @IBAction private func loginAction(_ sender: Any) {
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text,
            login == Constants.loginString && password == Constants.passwordString else {
            showErrorAlert(title: Constants.mistakeString, message: Constants.mistakeMessageString)
            return }
        UserDefaults.standard.set(true, forKey: Constants.keyString)
        toHelloUser?(login)
    }
    
    @IBAction private func goRegisterVCAction(_ sender: Any) {
        coordinator?.goRegistration()
    }
}

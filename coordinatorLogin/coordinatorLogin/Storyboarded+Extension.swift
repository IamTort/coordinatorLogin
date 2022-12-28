//  Storyboarded+Extension.swift
//  coordinatorLogin
//  Created by angelina on 28.12.2022.

import UIKit

/// Расширение создания контроллера
extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}

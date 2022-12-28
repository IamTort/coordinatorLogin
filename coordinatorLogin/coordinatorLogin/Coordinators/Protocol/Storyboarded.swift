//  Storyboarded.swift
//  coordinatorLogin
//  Created by angelina on 28.12.2022.

import UIKit

/// Протокол для создание контроллера
protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}


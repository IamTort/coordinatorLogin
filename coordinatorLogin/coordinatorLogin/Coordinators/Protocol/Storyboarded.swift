//  Storyboarded.swift
//  coordinatorLogin
//  Created by angelina on 28.12.2022.

import UIKit

/// Протокол для создания контроллера
protocol Storyboarded {
    static func instantiate() -> Self
}

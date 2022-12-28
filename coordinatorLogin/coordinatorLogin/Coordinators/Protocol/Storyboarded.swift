//  Storyboarded.swift
//  coordinatorLogin
//  Created by angelina on 28.12.2022.

import Foundation

/// Протокол для создания контроллера
protocol Storyboarded {
    static func instantiate() -> Self
}

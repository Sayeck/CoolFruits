//
//  Coordinator.swift
//  CoolFruits
//
//  Created by Alejandro Enrique Campos Iriarte on 21/07/22.
//

import Foundation
import UIKit

enum Page {
    case home
    case detail(_ selectedItem: FruitModel)
}

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
   
    func start()
    func navigate(to view: Page)
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}

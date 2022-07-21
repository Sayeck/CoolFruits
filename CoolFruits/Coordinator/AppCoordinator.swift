//
//  AppCoordinator.swift
//  CoolFruits
//
//  Created by Alejandro Enrique Campos Iriarte on 21/07/22.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigate(to: .home)
    }
    
    func navigate(to page: Page) {
        switch page {
        case .home:

            var viewController: UIViewController & Coordinating = FruitsViewController()
            viewController.coordinator = self
            
            navigationController.pushViewController(viewController, animated: true)

        case .detail(let selectedItem):

            var viewController: UIViewController & Coordinating = FruitDetailViewController(selectedItem: selectedItem)
            viewController.title = selectedItem.name
            viewController.coordinator = self

            navigationController.pushViewController(viewController, animated: true)

        }
    }
    
}

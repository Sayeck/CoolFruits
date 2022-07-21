//
//  UIViewController+Extension.swift
//  CoolFruits
//
//  Created by Alejandro Enrique Campos Iriarte on 21/07/22.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String = "Alert", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "Accept", style: .default, handler: nil)
        
        alertController.addAction(actionAlert)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

//
//  Spinner.swift
//  CoolFruits
//
//  Created by Alejandro Enrique Campos Iriarte on 21/07/22.
//

import Foundation
import UIKit

protocol SpinnerActions {
    func showSpinner(_ controller: UIViewController)
    func hideSpinner()
}

class Spinner {
    
    lazy var activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    init() {
        print("init")
    }

    deinit {
        print("deinit")
    }
    
}

// MARK: SpinnerActions Protocol

extension Spinner: SpinnerActions {
    
    func showSpinner(_ controller: UIViewController) {
        let frame = UIScreen.main.bounds
        
        controller.view.addSubview(activityIndicatorView)
        
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor)
        ])
        activityIndicatorView.frame = frame
        activityIndicatorView.startAnimating()
    }
    
    func hideSpinner() {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.removeFromSuperview()
    }
    
}

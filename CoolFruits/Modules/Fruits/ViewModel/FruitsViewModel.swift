//
//  FruitsViewController.swift
//  CoolFruits
//
//  Created by Alejandro Enrique Campos Iriarte on 21/07/22.
//

import Foundation

protocol FruitsViewModelProtocol {
    var fruits: Observable<[FruitModel]> { get set }
    var error: Observable<Bool> { get set }
    var errorMessage: String? { get set }
    var selectedItem: FruitModel? { get set }
    
    func fetchData()
}

final class FruitsViewModel: FruitsViewModelProtocol {
    
    // MARK: Public properties
    
    var fruits: Observable<[FruitModel]> = Observable<[FruitModel]>([])
    
    var error: Observable<Bool> = Observable<Bool>(false)
    
    var errorMessage: String?
    
    var selectedItem: FruitModel?
    
    // MARK: Public methods
    
    func fetchData() {
        RequestManager.shared.loadFruits { result in
            switch result {
            case .success(let data):
                self.fruits.value = data
            case .failure(let error):
                self.setError(message: error.localizedDescription, showError: true)
            }
        }
    }
    
    // MARK: Private methods
    
    private func setError(message: String, showError: Bool) {
        errorMessage = message
        error.value = showError
    }
    
}

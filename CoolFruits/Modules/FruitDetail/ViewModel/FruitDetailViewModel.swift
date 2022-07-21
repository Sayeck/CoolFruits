//
//  FruitDetailViewModel.swift
//  CoolFruits
//
//  Created by Alejandro Enrique Campos Iriarte on 21/07/22.
//

import Foundation

protocol FruitDetailViewModelProtocol {
    var fruit: FruitModel { get set }
}

final class FruitDetailViewModel: FruitDetailViewModelProtocol {
   
    // MARK: Public properties
    
    var fruit: FruitModel = FruitModel()
    
}

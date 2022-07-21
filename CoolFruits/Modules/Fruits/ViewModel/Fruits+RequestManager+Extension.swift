//
//  Fruits+RequestManager+Extension.swift
//  CoolFruits
//
//  Created by Alejandro Enrique Campos Iriarte on 21/07/22.
//

import Foundation

extension RequestManager {
    
    func loadFruits(completion: @escaping (Result<[FruitModel], NetworkError>) -> Void) {
        RequestManager.shared.execute(endpoint: .fruits, objectType: [FruitModel].self) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

//
//  EnvironmentFactory.swift
//  CoolFruits
//
//  Created by Alejandro Enrique Campos Iriarte on 21/07/22.
//

import Foundation

protocol Environment {
    
    var identifier: String { get }
    var server: String { get }

}

class ProdEnvironment: Environment {
    
    var identifier = "prod"
    var server = "https://www.fruityvice.com/api/fruit"
    
}

class DevEnvironment: Environment {
    
    var identifier = "dev"
    var server = "https://www.fruityvice.com/api/fruit"
    
}

class EnvironmentFactory {
    
    enum EnvType {
        case prod
        case dev
    }
    
    func create(_ type: EnvType) -> Environment {
        switch type {
        case .prod:
            return ProdEnvironment()
        case .dev:
            return DevEnvironment()
        }
    }
    
}

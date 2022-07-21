//
//  FruitModel.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 19-07-22.
//

import Foundation

// MARK: - FruitModel
struct FruitModel: Codable {
    var genus, name: String?
    var id: Int?
    var family, order: String?
    var nutritions: NutritionsModel?
    
    // MARK: Extra
    func isCitrus() -> Bool {
        return genus == "Citrus"
    }
    
    enum CodingKeys: String, CodingKey {
        case genus, name, id, family, order, nutritions
    }
}

// MARK: - NutritionsModel
struct NutritionsModel: Codable {
    var carbohydrates, protein, fat: Double?
    var calories: Int?
    var sugar: Double?
    enum CodingKeys: String, CodingKey {
        case carbohydrates, protein, fat, calories, sugar
    }
}

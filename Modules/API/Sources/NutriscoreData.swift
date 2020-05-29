//
//  NutriscoreData.swift
//  API
//
//  Created by Rafal Szastok on 29/05/2020.
//

import Foundation

public struct NutriscoreData: Codable {
    public let sodiumValue, negativePoints, sodium: Int
    public let saturatedFatRatioValue, saturatedFatRatio: Double
    public let sodiumPoints: Int
    public let sugars, saturatedFat, fiberValue, saturatedFatValue: Double
    public let fiber: Double
    public let energyPoints, fruitsVegetablesNutsColzaWalnutOliveOils, fiberPoints, sugarsPoints: Int
    public let energy, isBeverage, isCheese, energyValue: Int
    public let fruitsVegetablesNutsColzaWalnutOliveOilsValue, fruitsVegetablesNutsColzaWalnutOliveOilsPoints, proteinsPoints: Int
    public let proteinsValue: Double
    public let score: Int
    public let grade: String
    public let saturatedFatRatioPoints: Int
    public let proteins: Double
    public let saturatedFatPoints, isWater: Int
    public let sugarsValue: Double
    public let isFat, positivePoints: Int

    enum CodingKeys: String, CodingKey {
        case sodiumValue = "sodium_value"
        case negativePoints = "negative_points"
        case sodium
        case saturatedFatRatioValue = "saturated_fat_ratio_value"
        case saturatedFatRatio = "saturated_fat_ratio"
        case sodiumPoints = "sodium_points"
        case sugars
        case saturatedFat = "saturated_fat"
        case fiberValue = "fiber_value"
        case saturatedFatValue = "saturated_fat_value"
        case fiber
        case energyPoints = "energy_points"
        case fruitsVegetablesNutsColzaWalnutOliveOils = "fruits_vegetables_nuts_colza_walnut_olive_oils"
        case fiberPoints = "fiber_points"
        case sugarsPoints = "sugars_points"
        case energy
        case isBeverage = "is_beverage"
        case isCheese = "is_cheese"
        case energyValue = "energy_value"
        case fruitsVegetablesNutsColzaWalnutOliveOilsValue = "fruits_vegetables_nuts_colza_walnut_olive_oils_value"
        case fruitsVegetablesNutsColzaWalnutOliveOilsPoints = "fruits_vegetables_nuts_colza_walnut_olive_oils_points"
        case proteinsPoints = "proteins_points"
        case proteinsValue = "proteins_value"
        case score, grade
        case saturatedFatRatioPoints = "saturated_fat_ratio_points"
        case proteins
        case saturatedFatPoints = "saturated_fat_points"
        case isWater = "is_water"
        case sugarsValue = "sugars_value"
        case isFat = "is_fat"
        case positivePoints = "positive_points"
    }
}

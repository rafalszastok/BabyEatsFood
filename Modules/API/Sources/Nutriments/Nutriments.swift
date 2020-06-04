

import Foundation

import ObjectMapper

public struct Nutriments: Codable {
    let carbohydrates: Double
    let sugarsUnit: String
    let salt100G: Double
    let energyServing: Int
    let ironLabel: String
    let energyKcalValue, vitaminC: Int
    let fiberValue: Double
    let novaGroup100G: Int
    let calciumServing: Double
    let sodiumUnit: String
    let saltServing, sodium100G: Double
    let sodiumValue: Int
    let vitaminAUnit: String
    let proteins100G: Double
    let nutritionScoreFr: Int
    let saturatedFatValue, carbohydratesValue: Double
    let energyKcal: Int
    let cholesterol100G: Double
    let saturatedFatServing: Int
    let proteins: Double
    let energyKcalServing: Int
    let ironValue: Double
    let energy100G: Int
    let proteinsValue, saturatedFat100G: Double
    let novaGroupServing: Int
    let fiberUnit: String
    let cholesterolValue, vitaminA: Int
    let sugarsValue: Double
    let transFatUnit: String
    let calciumValue: Int
    let iron100G, fiber100G: Double
    let saturatedFatUnit: String
    let salt, iron: Double
    let transFat, transFat100G, transFatServing: Int
    let vitaminCUnit: String
    let cholesterol: Double
    let energy, transFatValue: Int
    let vitaminCLabel: String
    let calcium100G: Double
    let vitaminC100G, sugarsServing, vitaminAValue: Int
    let sugars: Double
    let vitaminCValue, vitaminA100G, carbohydratesServing, proteinsServing: Int
    let calciumLabel: String
    let fiber: Double
    let fruitsVegetablesNutsEstimateFromIngredients100G: Int
    let cholesterolLabel: String
    let energyKcal100G: Int
    let sodium: Double
    let fatServing, vitaminAServing: Int
    let ironServing: Double
    let fatUnit: String
    let sugars100G: Double
    let proteinsUnit, energyUnit, vitaminALabel: String
    let novaGroup: Int
    let calciumUnit: String
    let vitaminCServing: Int
    let carbohydratesUnit: String
    let fat100G: Double
    let energyKcalUnit: String
    let sodiumServing, saltValue: Double
    let transFatLabel: String
    let calcium, fatValue, carbohydrates100G, fiberServing: Double
    let saltUnit: String
    let cholesterolServing: Double
    let ironUnit: String
    let nutritionScoreFr100G: Int
    let saturatedFat: Double
    let cholesterolUnit: String
    let fat: Double
    let energyValue: Int

    enum CodingKeys: String, CodingKey {
        case carbohydrates
        case sugarsUnit = "sugars_unit"
        case salt100G = "salt_100g"
        case energyServing = "energy_serving"
        case ironLabel = "iron_label"
        case energyKcalValue = "energy-kcal_value"
        case vitaminC = "vitamin-c"
        case fiberValue = "fiber_value"
        case novaGroup100G = "nova-group_100g"
        case calciumServing = "calcium_serving"
        case sodiumUnit = "sodium_unit"
        case saltServing = "salt_serving"
        case sodium100G = "sodium_100g"
        case sodiumValue = "sodium_value"
        case vitaminAUnit = "vitamin-a_unit"
        case proteins100G = "proteins_100g"
        case nutritionScoreFr = "nutrition-score-fr"
        case saturatedFatValue = "saturated-fat_value"
        case carbohydratesValue = "carbohydrates_value"
        case energyKcal = "energy-kcal"
        case cholesterol100G = "cholesterol_100g"
        case saturatedFatServing = "saturated-fat_serving"
        case proteins
        case energyKcalServing = "energy-kcal_serving"
        case ironValue = "iron_value"
        case energy100G = "energy_100g"
        case proteinsValue = "proteins_value"
        case saturatedFat100G = "saturated-fat_100g"
        case novaGroupServing = "nova-group_serving"
        case fiberUnit = "fiber_unit"
        case cholesterolValue = "cholesterol_value"
        case vitaminA = "vitamin-a"
        case sugarsValue = "sugars_value"
        case transFatUnit = "trans-fat_unit"
        case calciumValue = "calcium_value"
        case iron100G = "iron_100g"
        case fiber100G = "fiber_100g"
        case saturatedFatUnit = "saturated-fat_unit"
        case salt, iron
        case transFat = "trans-fat"
        case transFat100G = "trans-fat_100g"
        case transFatServing = "trans-fat_serving"
        case vitaminCUnit = "vitamin-c_unit"
        case cholesterol, energy
        case transFatValue = "trans-fat_value"
        case vitaminCLabel = "vitamin-c_label"
        case calcium100G = "calcium_100g"
        case vitaminC100G = "vitamin-c_100g"
        case sugarsServing = "sugars_serving"
        case vitaminAValue = "vitamin-a_value"
        case sugars
        case vitaminCValue = "vitamin-c_value"
        case vitaminA100G = "vitamin-a_100g"
        case carbohydratesServing = "carbohydrates_serving"
        case proteinsServing = "proteins_serving"
        case calciumLabel = "calcium_label"
        case fiber
        case fruitsVegetablesNutsEstimateFromIngredients100G = "fruits-vegetables-nuts-estimate-from-ingredients_100g"
        case cholesterolLabel = "cholesterol_label"
        case energyKcal100G = "energy-kcal_100g"
        case sodium
        case fatServing = "fat_serving"
        case vitaminAServing = "vitamin-a_serving"
        case ironServing = "iron_serving"
        case fatUnit = "fat_unit"
        case sugars100G = "sugars_100g"
        case proteinsUnit = "proteins_unit"
        case energyUnit = "energy_unit"
        case vitaminALabel = "vitamin-a_label"
        case novaGroup = "nova-group"
        case calciumUnit = "calcium_unit"
        case vitaminCServing = "vitamin-c_serving"
        case carbohydratesUnit = "carbohydrates_unit"
        case fat100G = "fat_100g"
        case energyKcalUnit = "energy-kcal_unit"
        case sodiumServing = "sodium_serving"
        case saltValue = "salt_value"
        case transFatLabel = "trans-fat_label"
        case calcium
        case fatValue = "fat_value"
        case carbohydrates100G = "carbohydrates_100g"
        case fiberServing = "fiber_serving"
        case saltUnit = "salt_unit"
        case cholesterolServing = "cholesterol_serving"
        case ironUnit = "iron_unit"
        case nutritionScoreFr100G = "nutrition-score-fr_100g"
        case saturatedFat = "saturated-fat"
        case cholesterolUnit = "cholesterol_unit"
        case fat
        case energyValue = "energy_value"
    }
}

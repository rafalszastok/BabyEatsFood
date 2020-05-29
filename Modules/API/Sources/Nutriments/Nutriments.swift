

import Foundation

import ObjectMapper

struct Nutriments: Codable {
    var energy: NutrimentItem?
    var fats: [NutrimentItem]
    var carbohydrates: [NutrimentItem]
    var fiber: NutrimentItem?
    var proteins: [NutrimentItem]
    var salt: NutrimentItem?
    var sodium: NutrimentItem?
    var alcohol: NutrimentItem?
    var vitamins: [NutrimentItem]
    var minerals: [NutrimentItem]
    var carbonFootprint: Double?
    var carbonFootprintUnit: String?

    init?(map: Map) {
        fats = [NutrimentItem]()
        carbohydrates = [NutrimentItem]()
        proteins = [NutrimentItem]()
        vitamins = [NutrimentItem]()
        minerals = [NutrimentItem]()
    }

    func allItems() -> [NutrimentItem] {
        var results: [NutrimentItem?] = [NutrimentItem?]()
        results.append(energy)
        results.append(contentsOf: fats)
        results.append(contentsOf: carbohydrates)
        results.append(fiber)
        results.append(contentsOf: proteins)
        results.append(contentsOf: [salt, sodium, alcohol])
        results.append(contentsOf: vitamins)
        results.append(contentsOf: minerals)
        return results.compactMap { $0 }
    }
}

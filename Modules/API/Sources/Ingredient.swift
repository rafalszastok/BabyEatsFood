
import Foundation
import ObjectMapper

public struct Ingredient: Codable {
    let vegetarian: String?
    let id, text: String
    let percentMax: Double
    let rank: Int?
    let vegan: String?
    let percentMin: Double
    let fromPalmOil, hasSubIngredients: String?

    enum CodingKeys: String, CodingKey {
        case vegetarian, id, text
        case percentMax = "percent_max"
        case rank, vegan
        case percentMin = "percent_min"
        case fromPalmOil = "from_palm_oil"
        case hasSubIngredients = "has_sub_ingredients"
    }
}

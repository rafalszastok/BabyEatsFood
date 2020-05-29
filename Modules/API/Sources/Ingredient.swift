

import Foundation

import ObjectMapper

struct Ingredient: Decodable {
    var text: String?
    var id: String?
    var rank: String?

    init() {}
    init?(map: Map) {}

    mutating func mapping(map: Map) {
        text <- map[OFFJson.IngredientsElementTextKey]
        id <- map[OFFJson.IngredientsElementIdKey]
        rank <- map[OFFJson.IngredientsElementRankKey]
    }
}



import Foundation

import ObjectMapper

struct Ingredient: Mappable {
    var text: String?
    var id: String?
    var rank: String?

    /// used to get dynamic ingredients properties
    var rawJson: [String: Any]?

    init() {}
    init?(map: Map) {}

    mutating func mapping(map: Map) {
        text <- map[OFFJson.IngredientsElementTextKey]
        id <- map[OFFJson.IngredientsElementIdKey]
        rank <- map[OFFJson.IngredientsElementRankKey]

        rawJson = map.JSON
    }
}

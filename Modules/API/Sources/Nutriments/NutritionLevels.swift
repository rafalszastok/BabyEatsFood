

import Foundation

import ObjectMapper

public enum NutritionLevel: String, Codable {
    case low
    case moderate
    case high
}

public final class NutritionLevelTransform {

    public func transformFromJSON(_ value: Any?) -> NutritionLevel? {
        if let level = value as? String {
            return NutritionLevel(rawValue: level)
        }

        return nil
    }

    public func transformToJSON(_ value: NutritionLevel?) -> String? {
        if let level = value {
            return level.rawValue
        }

        return nil
    }
}

public struct NutritionLevels: Decodable {
    var fat: NutritionLevel?
    var saturatedFat: NutritionLevel?
    var sugars: NutritionLevel?
    var salt: NutritionLevel?

}

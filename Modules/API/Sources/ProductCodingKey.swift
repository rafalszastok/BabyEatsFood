//
//  ProductKey.swift
//  API
//
//  Created by Rafal Szastok on 04/06/2020.
//

import Foundation

public enum ProductCodingKey {
    public enum ImageKind: String, CaseIterable, CodingKey {
        case frontSmall = "image_front_small_url"
        case frontThumb = "image_front_thumb_url"
        case front = "image_front_url"
        case ingredientsSmall = "image_ingredients_small_url"
        case ingredientsThumb = "image_ingredients_thumb_url"
        case ingredients = "image_ingredients_url"
        case nutritionSmall = "image_nutrition_small_url"
        case nutritionThumb = "image_nutrition_thumb_url"
        case nutrition = "image_nutrition_url"
        case small = "image_small_url"
        case thumb = "image_thumb_url"
        case standard = "image_url"

        public var priority: Int {
            switch self {
            case .standard:
                return 10
            case .front:
                return 9
            case .nutrition:
                return 8
            case .ingredients:
                return 7
            case .small, .frontSmall, .nutritionSmall, .ingredientsSmall:
                return 6
            case .frontThumb, .thumb, .ingredientsThumb, .nutritionThumb:
                return 5
            }
        }
    }
}

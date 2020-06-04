//
//  ProductExtras.swift
//  API
//
//  Created by Rafal Szastok on 29/05/2020.
//

import Foundation

public struct CategoryProperties: Codable {
    let ciqualFoodNameEn: String? = nil

    enum CodingKeys: String, CodingKey {
        case ciqualFoodNameEn = "ciqual_food_name:en"
    }
}

public struct Languages: Codable {
    let enEnglish: Int

    enum CodingKeys: String, CodingKey {
        case enEnglish = "en:english"
    }
}

// MARK: - LanguagesCodes
public struct LanguagesCodes: Codable {
    public let en: Int
}

// MARK: - NutrientLevels
public struct NutrientLevels: Codable {
    let fat, sugars, salt, saturatedFat: String

    enum CodingKeys: String, CodingKey {
        case fat, sugars, salt
        case saturatedFat = "saturated-fat"
    }
}

public struct SelectedImages: Codable {
    public let ingredients, nutrition, front: SelectedImagesFront
}

public struct SelectedImagesFront: Codable {
    public let small, thumb, display: Display
}

public struct Display: Codable {
    public let en: String
}

public struct Source: Codable {
    let name: String
//    let manufacturer: JSONNull?
//    let images: [JSONAny]
//    let url: String
    let id: String
    let importT: Int
    let fields: [String]

    enum CodingKeys: String, CodingKey {
        case name
//        case manufacturer, images, url,
        case id
        case importT = "import_t"
        case fields
    }
}

public struct SourcesFields: Codable {
    public let orgDatabaseUsda: OrgDatabaseUsda

    enum CodingKeys: String, CodingKey {
        case orgDatabaseUsda = "org-database-usda"
    }
}

public struct OrgDatabaseUsda: Codable {
    let fdcID, fdcCategory: String
    let publicationDate: Date
    let fdcDataSource: String
    let availableDate, modifiedDate: Date

    enum CodingKeys: String, CodingKey {
        case fdcID = "fdc_id"
        case fdcCategory = "fdc_category"
        case publicationDate = "publication_date"
        case fdcDataSource = "fdc_data_source"
        case availableDate = "available_date"
        case modifiedDate = "modified_date"
    }
}

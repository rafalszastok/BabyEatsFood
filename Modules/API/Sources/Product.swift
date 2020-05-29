import Foundation
import ObjectMapper
import UIKit

public struct Product: Codable {
    public let additivesN: Int
    public let complete: Int
    public let additivesOldN: Int
    public let additivesOldTags: [String]
    public let allergensFromIngredients: String
    public let allergensFromUser: String
    public let allergensTags: [String]
    public let brandOwner: String
    public let brands: String
    public let brandsTags: [String]
    public let categoriesHierarchy: [String]
    public let categoryProperties: CategoryProperties
    public let ciqualFoodNameTags: [String]
    public let codesTags: [String]
    public let comparedToCategory, categoriesLc, nutritionDataPer: String
    public let completedT, rev: Int
    public let completeness: Double
    public let countries, lastModifiedBy: String
    public let countriesHierarchy: [String]
    public let countriesImported: String
    public let countriesLc: String
    public let countriesTags, correctorsTags: [String]
    public let createdT: Int
    public let creator: String
    public let dataQualityTags, ingredientsAnalysisTags, ingredientsTags: [String]
    public let dataSources, novaGroups: String
    public let dataSourcesImported: String
    public let dataSourcesTags: [String]
    public let editors, allergensHierarchy: [String]
    public let editorsTags, statesTags: [String]
    public let embCodes20141016: String
    public let embCodes: String
    public let entryDatesTags: [String]
    public let expirationDate: String
    public let fruitsVegetablesNuts100GEstimate: Int
    public let genericName, maxImgid, embCodesOrig, states: String
    public let genericNameEn, lang: String
    public let genericNameFr: String
    public let imageFrontSmallURL: String
    public let imageFrontThumbURL: String
    public let imageFrontURL: String
    public let imageIngredientsSmallURL: String
    public let imageIngredientsThumbURL: String
    public let imageIngredientsURL: String
    public let imageNutritionSmallURL: String
    public let imageNutritionThumbURL: String
    public let imageNutritionURL: String
    public let imageSmallURL: String
    public let imageThumbURL: String
    public let imageURL: String
    public let informersTags: [String]
    public let ingredients: [Ingredient]
    public let ingredientsFromOrThatMayBeFromPalmOilN: Int
    public let ingredientsFromPalmOilN: Int
    public let ingredientsHierarchy: [String]
    public let ingredientsN: Int
    public let ingredientsNTags: [String]
    public let ingredientsOriginalTags: [String]
    public let ingredientsPercentAnalysis: Int
    public let ingredientsText, lastEditor: String
    public let ingredientsTextEnImported, ingredientsTextEn, packaging: String
    public let ingredientsTextFr: String
    public let ingredientsTextWithAllergens, categories: String
    public let ingredientsThatMayBeFromPalmOilN, lastModifiedT: Int
    public let interfaceVersionCreated: String
    public let interfaceVersionModified, categoriesImported: String
    public let keywords: [String]
    public let knownIngredientsN: Int
    public let labels: String
    public let labelsHierarchy: [String]
    public let labelsLc, productNameFr, brandOwnerImported: String
    public let labelsPrevHierarchy: [String]
    public let labelsPrevTags: [String]
    public let languages: Languages
    public let languagesCodes: LanguagesCodes
    public let languagesHierarchy: [String]
    public let languagesTags: [String]
    public let lastEditDatesTags: [String]
    public let lastImageDatesTags: [String]
    public let lastImageT: Int
    public let lc: String
    public let lcImported: String
    public let link: String
    public let manufacturingPlacesTags: [String]
    public let miscTags: [String]
    public let newAdditivesN: Int
    public let noNutritionData: String
    public let novaGroup: Int
    public let novaGroupsTags: [String]
    public let nutrientLevels: NutrientLevels
    public let nutrientLevelsTags: [String]
    public let nutriments: Nutriments
    public let nutriscoreData: NutriscoreData
    public let nutriscoreGrade: String
    public let nutriscoreScore: Int
    public let nutritionData: String
    public let nutritionDataPrepared: String
    public let nutritionDataPreparedPer: String
    public let nutritionDataPreparedPerImported: String
    public let nutritionGradeFr: String
    public let nutritionGrades, manufacturingPlaces, code, allergens: String
    public let nutritionGradesTags: [String]
    public let nutritionScoreBeverage: Int
    public let nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredients: Int
    public let nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredientsValue: Int
    public let origins: String
    public let packagingTags: [String]
    public let photographersTags, statesHierarchy, categoriesTags, labelsTags: [String]
    public let pnnsGroups1, stores: String
    public let pnnsGroups1_Tags: [String]
    public let pnnsGroups2: String
    public let pnnsGroups2_Tags, dataQualityInfoTags: [String]
    public let popularityTags: [String]
    public let productID: String
    public let productNameEn: String
    public let productQuantity: Double
    public let purchasePlaces, traces: String
    public let purchasePlacesTags: [String]
    public let scansN: Int
    public let selectedImages: SelectedImages
    public let servingQuantity, tracesFromIngredients: String
    public let servingSize, ingredientsTextWithAllergensEn, allergensImported: String
    public let servingSizeImported, productNameEnImported, quantity, id: String
    public let sortkey: Int
    public let sources: [Source]
    public let sourcesFields: SourcesFields
    public let storesTags: [String]
    public let tracesFromUser: String
    public let uniqueScansN: Int
    public let unknownIngredientsN: Int
    public let updateKey, productName, nutritionDataPerImported: String


    enum CodingKeys: String, CodingKey {
        case additivesN = "additives_n"
        case additivesOldN = "additives_old_n"
        case additivesOldTags = "additives_old_tags"
        case allergensFromIngredients = "allergens_from_ingredients"
        case allergensFromUser = "allergens_from_user"
        case allergensHierarchy = "allergens_hierarchy"
        case allergensImported = "allergens_imported"
        case allergensTags = "allergens_tags"
        case brandOwner = "brand_owner"
        case brandOwnerImported = "brand_owner_imported"
        case brands
        case brandsTags = "brands_tags"
        case categories
        case categoriesHierarchy = "categories_hierarchy"
        case categoriesImported = "categories_imported"
        case categoriesLc = "categories_lc"
        case categoriesTags = "categories_tags"
        case categoryProperties = "category_properties"
        case ciqualFoodNameTags = "ciqual_food_name_tags"
        case code, allergens
        case codesTags = "codes_tags"
        case comparedToCategory = "compared_to_category"
        case complete
        case completedT = "completed_t"
        case completeness
        case correctorsTags = "correctors_tags"
        case countries
        case countriesHierarchy = "countries_hierarchy"
        case countriesImported = "countries_imported"
        case countriesLc = "countries_lc"
        case countriesTags = "countries_tags"
        case createdT = "created_t"
        case creator
        case dataQualityInfoTags = "data_quality_info_tags"
        case dataQualityTags = "data_quality_tags"
        case dataSources = "data_sources"
        case dataSourcesImported = "data_sources_imported"
        case dataSourcesTags = "data_sources_tags"
        case editors
        case editorsTags = "editors_tags"
        case embCodes = "emb_codes"
        case embCodes20141016 = "emb_codes_20141016"
        case embCodesOrig = "emb_codes_orig"
        case entryDatesTags = "entry_dates_tags"
        case expirationDate = "expiration_date"
        case fruitsVegetablesNuts100GEstimate = "fruits-vegetables-nuts_100g_estimate"
        case genericName = "generic_name"
        case genericNameEn = "generic_name_en"
        case genericNameFr = "generic_name_fr"
        case id = "_id"
        case imageFrontSmallURL = "image_front_small_url"
        case imageFrontThumbURL = "image_front_thumb_url"
        case imageFrontURL = "image_front_url"
        case imageIngredientsSmallURL = "image_ingredients_small_url"
        case imageIngredientsThumbURL = "image_ingredients_thumb_url"
        case imageIngredientsURL = "image_ingredients_url"
        case imageNutritionSmallURL = "image_nutrition_small_url"
        case imageNutritionThumbURL = "image_nutrition_thumb_url"
        case imageNutritionURL = "image_nutrition_url"
        case imageSmallURL = "image_small_url"
        case imageThumbURL = "image_thumb_url"
        case imageURL = "image_url"
        case informersTags = "informers_tags"
        case ingredients
        case ingredientsAnalysisTags = "ingredients_analysis_tags"
        case ingredientsFromOrThatMayBeFromPalmOilN = "ingredients_from_or_that_may_be_from_palm_oil_n"
        case ingredientsFromPalmOilN = "ingredients_from_palm_oil_n"
        case ingredientsHierarchy = "ingredients_hierarchy"
        case ingredientsN = "ingredients_n"
        case ingredientsNTags = "ingredients_n_tags"
        case ingredientsOriginalTags = "ingredients_original_tags"
        case ingredientsPercentAnalysis = "ingredients_percent_analysis"
        case ingredientsTags = "ingredients_tags"
        case ingredientsText = "ingredients_text"
        case ingredientsTextEn = "ingredients_text_en"
        case ingredientsTextEnImported = "ingredients_text_en_imported"
        case ingredientsTextFr = "ingredients_text_fr"
        case ingredientsTextWithAllergens = "ingredients_text_with_allergens"
        case ingredientsTextWithAllergensEn = "ingredients_text_with_allergens_en"
        case ingredientsThatMayBeFromPalmOilN = "ingredients_that_may_be_from_palm_oil_n"
        case interfaceVersionCreated = "interface_version_created"
        case interfaceVersionModified = "interface_version_modified"
        case keywords = "_keywords"
        case knownIngredientsN = "known_ingredients_n"
        case labels
        case labelsHierarchy = "labels_hierarchy"
        case labelsLc = "labels_lc"
        case labelsPrevHierarchy = "labels_prev_hierarchy"
        case labelsPrevTags = "labels_prev_tags"
        case labelsTags = "labels_tags"
        case lang
        case languages
        case languagesCodes = "languages_codes"
        case languagesHierarchy = "languages_hierarchy"
        case languagesTags = "languages_tags"
        case lastEditDatesTags = "last_edit_dates_tags"
        case lastEditor = "last_editor"
        case lastImageDatesTags = "last_image_dates_tags"
        case lastImageT = "last_image_t"
        case lastModifiedBy = "last_modified_by"
        case lastModifiedT = "last_modified_t"
        case lc
        case lcImported = "lc_imported"
        case link
        case manufacturingPlaces = "manufacturing_places"
        case manufacturingPlacesTags = "manufacturing_places_tags"
        case maxImgid = "max_imgid"
        case miscTags = "misc_tags"
        case newAdditivesN = "new_additives_n"
        case noNutritionData = "no_nutrition_data"
        case novaGroup = "nova_group"
        case novaGroups = "nova_groups"
        case novaGroupsTags = "nova_groups_tags"
        case nutrientLevels = "nutrient_levels"
        case nutrientLevelsTags = "nutrient_levels_tags"
        case nutriments
        case nutriscoreData = "nutriscore_data"
        case nutriscoreGrade = "nutriscore_grade"
        case nutriscoreScore = "nutriscore_score"
        case nutritionData = "nutrition_data"
        case nutritionDataPer = "nutrition_data_per"
        case nutritionDataPerImported = "nutrition_data_per_imported"
        case nutritionDataPrepared = "nutrition_data_prepared"
        case nutritionDataPreparedPer = "nutrition_data_prepared_per"
        case nutritionDataPreparedPerImported = "nutrition_data_prepared_per_imported"
        case nutritionGradeFr = "nutrition_grade_fr"
        case nutritionGrades = "nutrition_grades"
        case nutritionGradesTags = "nutrition_grades_tags"
        case nutritionScoreBeverage = "nutrition_score_beverage"
        case nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredients = "nutrition_score_warning_fruits_vegetables_nuts_estimate_from_ingredients"
        case nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredientsValue = "nutrition_score_warning_fruits_vegetables_nuts_estimate_from_ingredients_value"
        case origins
        case packaging
        case photographersTags = "photographers_tags"
        case pnnsGroups1 = "pnns_groups_1"
        case pnnsGroups1_Tags = "pnns_groups_1_tags"
        case pnnsGroups2 = "pnns_groups_2"
        case pnnsGroups2_Tags = "pnns_groups_2_tags"
        case popularityTags = "popularity_tags"
        case productID = "id"
        case productName = "product_name"
        case productNameEn = "product_name_en"
        case productNameEnImported = "product_name_en_imported"
        case productNameFr = "product_name_fr"
        case productQuantity = "product_quantity"
        case purchasePlaces = "purchase_places"
        case purchasePlacesTags = "purchase_places_tags"
        case quantity
        case rev
        case scansN = "scans_n"
        case selectedImages = "selected_images"
        case servingQuantity = "serving_quantity"
        case servingSize = "serving_size"
        case servingSizeImported = "serving_size_imported"
        case sortkey
        case sources
        case sourcesFields = "sources_fields"
        case states
        case statesHierarchy = "states_hierarchy"
        case statesTags = "states_tags"
        case stores
        case storesTags = "stores_tags"
        case traces
        case tracesFromIngredients = "traces_from_ingredients"
        case tracesFromUser = "traces_from_user"
        case uniqueScansN = "unique_scans_n"
        case unknownIngredientsN = "unknown_ingredients_n"
        case updateKey = "update_key"
        case packagingTags = "packaging_tags"
    }
}

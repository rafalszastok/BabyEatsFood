//
//  Product+Docable.swift
//  API
//
//  Created by Rafal Szastok on 31/05/2020.
//

import Foundation

extension Product {

    enum CodingKeys: String, CodingKey {
//        case additivesN = "additives_n"
//        case additivesOldN = "additives_old_n"
//        case additivesOldTags = "additives_old_tags"
//        case allergensFromIngredients = "allergens_from_ingredients"
//        case allergensFromUser = "allergens_from_user"
//        case allergensHierarchy = "allergens_hierarchy"
//        case allergensImported = "allergens_imported"
//        case allergensTags = "allergens_tags"
//        case brandOwner = "brand_owner"
//        case brandOwnerImported = "brand_owner_imported"
//        case brands
//        case brandsTags = "brands_tags"
//        case categories
//        case categoriesHierarchy = "categories_hierarchy"
//        case categoriesImported = "categories_imported"
//        case categoriesLc = "categories_lc"
//        case categoriesTags = "categories_tags"
//        case categoryProperties = "category_properties"
//        case ciqualFoodNameTags = "ciqual_food_name_tags"
//        case code, allergens
//        case codesTags = "codes_tags"
//        case comparedToCategory = "compared_to_category"
//        case complete
//        case completedT = "completed_t"
//        case completeness
//        case correctorsTags = "correctors_tags"
//        case countries
//        case countriesHierarchy = "countries_hierarchy"
//        case countriesImported = "countries_imported"
//        case countriesLc = "countries_lc"
//        case countriesTags = "countries_tags"
//        case createdT = "created_t"
//        case creator
//        case dataQualityInfoTags = "data_quality_info_tags"
//        case dataQualityTags = "data_quality_tags"
//        case dataSources = "data_sources"
//        case dataSourcesImported = "data_sources_imported"
//        case dataSourcesTags = "data_sources_tags"
//        case editors
//        case editorsTags = "editors_tags"
//        case embCodes = "emb_codes"
//        case embCodes20141016 = "emb_codes_20141016"
//        case embCodesOrig = "emb_codes_orig"
//        case entryDatesTags = "entry_dates_tags"
//        case expirationDate = "expiration_date"
//        case fruitsVegetablesNuts100GEstimate = "fruits-vegetables-nuts_100g_estimate"
//        case genericName = "generic_name"
//        case genericNameEn = "generic_name_en"
//        case genericNameFr = "generic_name_fr"
//        case id = "_id"
//        case imageFrontSmallURL = "image_front_small_url"
//        case imageFrontThumbURL = "image_front_thumb_url"
//        case imageFrontURL = "image_front_url"
//        case imageIngredientsSmallURL = "image_ingredients_small_url"
//        case imageIngredientsThumbURL = "image_ingredients_thumb_url"
//        case imageIngredientsURL = "image_ingredients_url"
//        case imageNutritionSmallURL = "image_nutrition_small_url"
//        case imageNutritionThumbURL = "image_nutrition_thumb_url"
//        case imageNutritionURL = "image_nutrition_url"
//        case imageSmallURL = "image_small_url"
//        case imageThumbURL = "image_thumb_url"
//        case imageURL = "image_url"
//        case informersTags = "informers_tags"
//        case ingredients
//        case ingredientsAnalysisTags = "ingredients_analysis_tags"
//        case ingredientsFromOrThatMayBeFromPalmOilN = "ingredients_from_or_that_may_be_from_palm_oil_n"
//        case ingredientsFromPalmOilN = "ingredients_from_palm_oil_n"
//        case ingredientsHierarchy = "ingredients_hierarchy"
//        case ingredientsN = "ingredients_n"
//        case ingredientsNTags = "ingredients_n_tags"
//        case ingredientsOriginalTags = "ingredients_original_tags"
//        case ingredientsPercentAnalysis = "ingredients_percent_analysis"
//        case ingredientsTags = "ingredients_tags"
//        case ingredientsText = "ingredients_text"
//        case ingredientsTextEn = "ingredients_text_en"
//        case ingredientsTextEnImported = "ingredients_text_en_imported"
//        case ingredientsTextFr = "ingredients_text_fr"
//        case ingredientsTextWithAllergens = "ingredients_text_with_allergens"
//        case ingredientsTextWithAllergensEn = "ingredients_text_with_allergens_en"
//        case ingredientsThatMayBeFromPalmOilN = "ingredients_that_may_be_from_palm_oil_n"
//        case interfaceVersionCreated = "interface_version_created"
//        case interfaceVersionModified = "interface_version_modified"
//        case keywords = "_keywords"
//        case knownIngredientsN = "known_ingredients_n"
//        case labels
//        case labelsHierarchy = "labels_hierarchy"
//        case labelsLc = "labels_lc"
//        case labelsPrevHierarchy = "labels_prev_hierarchy"
//        case labelsPrevTags = "labels_prev_tags"
//        case labelsTags = "labels_tags"
//        case lang
//        case languages
//        case languagesCodes = "languages_codes"
//        case languagesHierarchy = "languages_hierarchy"
//        case languagesTags = "languages_tags"
//        case lastEditDatesTags = "last_edit_dates_tags"
//        case lastEditor = "last_editor"
//        case lastImageDatesTags = "last_image_dates_tags"
//        case lastImageT = "last_image_t"
//        case lastModifiedBy = "last_modified_by"
//        case lastModifiedT = "last_modified_t"
//        case lc
//        case lcImported = "lc_imported"
//        case link
//        case manufacturingPlaces = "manufacturing_places"
//        case manufacturingPlacesTags = "manufacturing_places_tags"
//        case maxImgid = "max_imgid"
//        case miscTags = "misc_tags"
//        case newAdditivesN = "new_additives_n"
//        case noNutritionData = "no_nutrition_data"
//        case novaGroup = "nova_group"
//        case novaGroups = "nova_groups"
//        case novaGroupsTags = "nova_groups_tags"
//        case nutrientLevels = "nutrient_levels"
//        case nutrientLevelsTags = "nutrient_levels_tags"
//        case nutriments
//        case nutriscoreData = "nutriscore_data"
//        case nutriscoreGrade = "nutriscore_grade"
//        case nutriscoreScore = "nutriscore_score"
//        case nutritionData = "nutrition_data"
//        case nutritionDataPer = "nutrition_data_per"
//        case nutritionDataPerImported = "nutrition_data_per_imported"
//        case nutritionDataPrepared = "nutrition_data_prepared"
//        case nutritionDataPreparedPer = "nutrition_data_prepared_per"
//        case nutritionDataPreparedPerImported = "nutrition_data_prepared_per_imported"
//        case nutritionGradeFr = "nutrition_grade_fr"
//        case nutritionGrades = "nutrition_grades"
//        case nutritionGradesTags = "nutrition_grades_tags"
//        case nutritionScoreBeverage = "nutrition_score_beverage"
//        case nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredients = "nutrition_score_warning_fruits_vegetables_nuts_estimate_from_ingredients"
//        case nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredientsValue = "nutrition_score_warning_fruits_vegetables_nuts_estimate_from_ingredients_value"
//        case origins
//        case packaging
//        case photographersTags = "photographers_tags"
//        case pnnsGroups1 = "pnns_groups_1"
//        case pnnsGroups1_Tags = "pnns_groups_1_tags"
//        case pnnsGroups2 = "pnns_groups_2"
//        case pnnsGroups2_Tags = "pnns_groups_2_tags"
//        case popularityTags = "popularity_tags"
//        case productID = "id"
        case productName = "product_name"
//        case productNameEn = "product_name_en"
//        case productNameEnImported = "product_name_en_imported"
//        case productNameFr = "product_name_fr"
//        case productQuantity = "product_quantity"
//        case purchasePlaces = "purchase_places"
//        case purchasePlacesTags = "purchase_places_tags"
//        case quantity
//        case rev
//        case scansN = "scans_n"
//        case selectedImages = "selected_images"
//        case servingQuantity = "serving_quantity"
//        case servingSize = "serving_size"
//        case servingSizeImported = "serving_size_imported"
//        case sortkey
//        case sources
//        case states
//        case statesHierarchy = "states_hierarchy"
//        case statesTags = "states_tags"
//        case stores
//        case storesTags = "stores_tags"
//        case traces
//        case tracesFromIngredients = "traces_from_ingredients"
//        case tracesFromUser = "traces_from_user"
//        case uniqueScansN = "unique_scans_n"
//        case unknownIngredientsN = "unknown_ingredients_n"
//        case updateKey = "update_key"
//        case packagingTags = "packaging_tags"
    }

    public init(from decoder: Decoder) throws {
        let keyedDecoder = try decoder.container(keyedBy: CodingKeys.self)
        self.productName = try keyedDecoder.decode(String.self, forKey: .productName)
    }
}

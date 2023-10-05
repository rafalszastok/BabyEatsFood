import Foundation
import UIKit

public struct Product: Codable {
    public typealias ImageKind = ProductCodingKey.ImageKind

    public let imagesUrlDictionary: [ImageKind: String]
    public let productName: String?
    public let nutritionGrades: String?
    public let nutriscoreScore: Int?
    public let novaGroup: String?
//    public let additivesOldN: Int?
//    public let additivesOldTags: [String]
//    public let allergens: String?
//    public let allergensFromIngredients: String?
//    public let allergensFromUser: String?
//    public let allergensHierarchy: [String]
//    public let allergensImported: String?
//    public let allergensTags: [String]
//    public let brandOwner: String?
//    public let brandOwnerImported: String?
//    public let brands: String?
//    public let brandsTags: [String]
//    public let categories: String?
//    public let categoriesHierarchy: [String]
//    public let categoriesImported: String?
//    public let categoriesLc: String?
//    public let categoriesTags: [String]
//    public let categoryProperties: CategoryProperties?
//    public let ciqualFoodNameTags: [String]
//    public let code: String?
//    public let codesTags: [String]
//    public let comparedToCategory: String?
//    public let complete: Int?
//    public let completedT: Int?
//    public let rev: Int?
//    public let completeness: Double
//    public let correctorsTags: [String]
//    public let countries: String?
//    public let countriesHierarchy: [String]
//    public let countriesImported: String?
//    public let countriesLc: String?
//    public let countriesTags: [String]
//    public let createdT: Int?
//    public let creator: String?
//    public let dataQualityInfoTags: [String]
//    public let dataQualityTags: [String]
//    public let dataSources: String?
//    public let dataSourcesImported: String?
//    public let dataSourcesTags: [String]
//    public let editors: [String]
//    public let editorsTags: [String]
//    public let embCodes20141016: String?
//    public let embCodes: String?
//    public let embCodesOrig: String?
//    public let entryDatesTags: [String]
//    public let expirationDate: String?
//    public let fruitsVegetablesNuts100GEstimate: Int?
//    public let genericName: String?
//    public let genericNameEn: String?
//    public let genericNameFr: String?
//    public let id: String?
//    public let informersTags: [String]
//    public let ingredients: [Ingredient]
//    public let ingredientsAnalysisTags: [String]
//    public let ingredientsFromOrThatMayBeFromPalmOilN: Int?
//    public let ingredientsFromPalmOilN: Int?
//    public let ingredientsHierarchy: [String]
//    public let ingredientsN: Int?
//    public let ingredientsNTags: [String]
//    public let ingredientsOriginalTags: [String]
//    public let ingredientsPercentAnalysis: Int?
//    public let ingredientsTags: [String]
//    public let ingredientsText: String?
//    public let ingredientsTextEn: String?
//    public let ingredientsTextEnImported: String?
//    public let ingredientsTextFr: String?
//    public let ingredientsTextWithAllergens: String?
//    public let ingredientsTextWithAllergensEn: String?
//    public let ingredientsThatMayBeFromPalmOilN: Int?
//    public let lastModifiedT: Int?
//    public let interfaceVersionCreated: String?
//    public let interfaceVersionModified: String?
//    public let keywords: [String]
//    public let knownIngredientsN: Int?
//    public let labels: String?
//    public let labelsHierarchy: [String]
//    public let labelsLc: String?
//    public let labelsPrevHierarchy: [String]
//    public let labelsPrevTags: [String]
//    public let labelsTags: [String]
//    public let lang: String?
//    public let languages: Languages?
//    public let languagesCodes: LanguagesCodes?
//    public let languagesHierarchy: [String]
//    public let languagesTags: [String]
//    public let lastEditDatesTags: [String]
//    public let lastEditor: String?
//    public let lastImageDatesTags: [String]
//    public let lastImageT: Int?
//    public let lastModifiedBy: String?
//    public let lc: String?
//    public let lcImported: String?
//    public let link: String?
//    public let manufacturingPlaces: String?
//    public let manufacturingPlacesTags: [String]
//    public let maxImgid: String?
//    public let miscTags: [String]
//    public let newAdditivesN: Int?
//    public let noNutritionData: String?
//    public let novaGroup: Int?
//    public let novaGroups: String?
//    public let novaGroupsTags: [String]
//    public let nutrientLevels: NutrientLevels?
//    public let nutrientLevelsTags: [String]
//    public let nutriments: Nutriments?
//    public let nutriscoreData: NutriscoreData?
//    public let nutritionData: String?
//    public let nutritionDataPer: String?
//    public let nutritionDataPerImported: String?
//    public let nutritionDataPrepared: String?
//    public let nutritionDataPreparedPer: String?
//    public let nutritionDataPreparedPerImported: String?
//    public let nutritionGradeFr: String?
//    public let nutritionGrades: String?
//    public let nutritionGradesTags: [String]
//    public let nutritionScoreBeverage: Int?
//    public let nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredients: Int?
//    public let nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredientsValue: Int?
//    public let origins: String?
//    public let packaging: String?
//    public let packagingTags: [String]
//    public let photographersTags: [String]
//    public let pnnsGroups1: String?
//    public let pnnsGroups1_Tags: [String]
//    public let pnnsGroups2: String?
//    public let pnnsGroups2_Tags: [String]
//    public let popularityTags: [String]
//    public let productID: String?
//    public let productNameEn: String?
//    public let productNameEnImported: String?
//    public let productNameFr: String?
//    public let productQuantity: Double
//    public let purchasePlaces: String?
//    public let purchasePlacesTags: [String]
//    public let quantity: String?
//    public let scansN: Int?
//    public let selectedImages: SelectedImages?
//    public let servingQuantity: String?
//    public let servingSize: String?
//    public let servingSizeImported: String?
//    public let sortkey: Int?
//    public let sources: [Source]
//    public let states: String?
//    public let statesHierarchy: [String]
//    public let statesTags: [String]
//    public let stores: String?
//    public let storesTags: [String]
//    public let traces: String?
//    public let tracesFromIngredients: String?
//    public let tracesFromUser: String?
//    public let uniqueScansN: Int?
//    public let unknownIngredientsN: Int?
//    public let updateKey: String?
//    public let additivesN: Int?

}

import ObjectMapper
import UIKit

enum NutritionDataPer: String, Codable {
    case hundredGrams = "100g"
    case serving
}

enum EnvironmentImpact: String, Codable {
    case low = "en:low"
    case medium = "en:medium"
    case high = "en:high"

    var asUIImage: UIImage {
        switch self {
        case .low: return UIImage(named: "co2-low")!
        case .medium: return UIImage(named: "co2-medium")!
        case .high: return UIImage(named: "co2-high")!
        }
    }
}

enum ImageTypeCategory {
    case front
    case ingredients
    case nutrition
    case general

    // These decriptions are used in the deselect/update API's to OFF
    var description: String {
        switch self {
        case .front:
            return "front"
        case .ingredients:
            return "ingredients"
        case .nutrition:
            return "nutrition"
        case .general:
            return "general"
        }
    }

    static var list: [ImageTypeCategory] {
        return [.front, .ingredients, .nutrition]
    }
}

enum ImageSizeCategory {
    case thumb
    case small
    case display
    case unknown

    var description: String {
        switch self {
        case .thumb:
            return "thumb"
        case .small:
            return "small"
        case .display:
            return "display"
        case .unknown:
            return "unknown"
        }
    }
}

public struct Product: Decodable {
    // var name: String?
    private var nameDecoded: String?
    private var genericNameDecoded: String?
    var brands: [String]?
    private var quantity: String?
    var imageUrl: String?
    var imageSmallUrl: String?
    private var frontImageUrlDecoded: String?
    private var frontImageSmallUrlDecoded: String?
    var barcode: String?
    var packaging: [String]?
    var categories: [String]?
    var categoriesTags: [String]?
    var nutriscore: String?
    var novaGroup: Int? {
        if novaGroupAsInt != nil {
            return novaGroupAsInt
        }
        if novaGroupAsString != nil {
            return Int(novaGroupAsString!)
        }
        return nil
    }
    private var novaGroupAsInt: Int?
    private var novaGroupAsString: String?
    var manufacturingPlaces: String?
    var origins: String?
    var labels: [String]?
    var citiesTags: [String]?
    var embCodesTags: [String]?
    var stores: [String]?
    // var countries: [String]?
    var countriesTags: [String]?
    private var ingredientsImageUrlDecoded: String?
    var allergens: [Allergen]?
    var traces: [Allergen]?
    var additives: [Additive]?
    var palmOilIngredients: [String]?
    var possiblePalmOilIngredients: [String]?
    var servingSize: String?
    var nutritionLevels: NutritionLevels?
    var nutritionDataPer: NutritionDataPer?
    var noNutritionData: String?
    var nutriments: Nutriments?
    private var nutritionTableImageDecoded: String?
    var lang: String?
    var states: [String]?
    var environmentInfoCard: String?
    var environmentImpactLevelTags: [EnvironmentImpact]?
    var nutritionTableHtml: String?
    var ingredientsAnalysisTags: [String]?
    var ingredientsAnalysisDetails: [IngredientsAnalysisDetail]?
    // new variables for local languages
    var languageCodes: [String: Int]?
    var names: [String: String] = [:]
    var genericNames: [String: String] = [:]
    var ingredients: [String: String] = [:]
    var ingredientsListDecoded: String?
    var ingredientsListAnalysis: [Ingredient]?
    var vitamins: [Vitamin]?
    var minerals: [Mineral]?
    var nucleotides: [Nucleotide]?
    var otherNutrients: [Nutriment]?

    private struct KeyPreFix {
        static let ProductName = "product_name_"
        static let GenericName = "generic_name_"
        static let IngredientsText = "ingredients_text_"
        static let IngredientsTextWithAllergens = "ingredients_text_with_allergens_"
    }

    var quantityValue: String?
    var quantityUnit: String?

    var ingredientsList: String? {
        get {
            if let validCode = matchedLanguageCode(codes: Locale.preferredLanguageCodes),
                let ingredient = ingredients[validCode],
                !ingredient.isEmpty {
                return ingredient
            } else {
                return ingredientsListDecoded
            }
        }
        set {
            ingredientsListDecoded = newValue
        }
    }

    var name: String? {
        get {
            if let validCode = matchedLanguageCode(codes: Locale.preferredLanguageCodes),
                let name = names[validCode],
                !name.isEmpty {
                return name
            } else {
                return nameDecoded
            }
        }
        set {
            nameDecoded = newValue
        }
    }

    var genericName: String? {
        get {
            if let validCode = matchedLanguageCode(codes: Locale.preferredLanguageCodes),
                let name = genericNames[validCode],
                !name.isEmpty {
                return name
            } else {
                return genericNameDecoded
            }
        }
        set {
            genericNameDecoded = newValue
        }
    }

    init() {}
    init?(map: Map) {}

    // swiftlint:disable function_body_length
    mutating func mapping(map: Map) {
        additives <- map[OFFJson.AdditivesTagsKey]
        allergens <- map[OFFJson.AllergensTagsKey]
        barcode <- map[OFFJson.CodeKey]
        brands <- (map[OFFJson.BrandsKey], ArrayTransform())
        categories <- (map[OFFJson.CategoriesKey], ArrayTransform())
        categoriesTags <- map[OFFJson.CategoriesTagsKey]
        nutriscore <- map[OFFJson.NutritionGradesKey]
        novaGroupAsInt <- map[OFFJson.NovaGroupKey]
        novaGroupAsString <- map[OFFJson.NovaGroupKey]
        manufacturingPlaces <- map[OFFJson.ManufacturingPlacesKey]
        origins <- map[OFFJson.OriginsKey]
        labels <- (map[OFFJson.LabelsKey], ArrayTransform())
        citiesTags <- map[OFFJson.CitiesTagsKey]
        countriesTags <- map[OFFJson.CountriesTagsKey]
        embCodesTags <- map[OFFJson.EmbCodesTagsKey]
        environmentInfoCard <- map[OFFJson.EnvironmentInfoCardKey]
        environmentImpactLevelTags <- map[OFFJson.EnvironmentImpactLevelTagsKey]
        frontImageSmallUrlDecoded <- map[OFFJson.ImageFrontSmallUrlKey]
        frontImageUrlDecoded <- map[OFFJson.ImageFrontUrlKey]
        genericNameDecoded <- map[OFFJson.GenericNameKey]
        imageSmallUrl <- map[OFFJson.ImageSmallUrlKey]
        imageUrl <- map[OFFJson.ImageUrlKey]
        ingredientsImageUrlDecoded <- map[OFFJson.ImageIngredientsUrlKey]
        ingredientsListDecoded <- map[OFFJson.IngredientsKey]
        labels <- (map[OFFJson.LabelsKey], ArrayTransform())
        lang <- map[OFFJson.LangKey]
        languageCodes <- map[OFFJson.LanguageCodesKey]
        manufacturingPlaces <- map[OFFJson.ManufacturingPlacesKey]
        minerals <- map[OFFJson.MineralsTagsKey]
        nameDecoded <- map[OFFJson.ProductNameKey]
        noNutritionData <- map[OFFJson.NoNutritionDataKey]
        nucleotides <- map[OFFJson.NucleotidesTagsKey]
        nutriments <- map[OFFJson.NutrimentsKey]
        nutriscore <- map[OFFJson.NutritionGradesKey]
        nutritionDataPer <- map[OFFJson.NutritionDataPerKey]
        nutritionLevels <- map[OFFJson.NutrientLevelsKey]
        nutritionTableImageDecoded <- map[OFFJson.ImageNutritionUrlKey]
        nutritionTableHtml <- map[OFFJson.NutritionTableHtml]
        ingredientsAnalysisTags <- map[OFFJson.IngredientsAnalysisTags]
        ingredientsListAnalysis <- map[OFFJson.IngredientsElementKey]
        origins <- map[OFFJson.OriginsKey]
        otherNutrients <- map[OFFJson.OtherNutritionalSubstancesTagsKey]
        packaging <- (map[OFFJson.PackagingKey], ArrayTransform())
        palmOilIngredients <- map[OFFJson.IngredientsFromPalmOilTagsKey]
        possiblePalmOilIngredients <- map[OFFJson.IngredientsThatMayBeFromPalmOilTagsKey]
        servingSize <- map[OFFJson.ServingSizeKey]
        states <- (map[OFFJson.StatesKey], ArrayTransform())
        stores <- (map[OFFJson.StoresKey], ArrayTransform())
        traces <- map[OFFJson.TracesTagsKey]
        vitamins <- map[OFFJson.VitaminsTagsKey]
        quantity <- map[OFFJson.QuantityKey]

        // try to extract all language specific fields

        // guard let validLanguageCodes = languageCodes else { return }

        for languageCode in Locale.preferredLanguageCodes {
            names[languageCode] <- map[OFFJson.ProductNameKey + OFFJson.KeySeparator + languageCode]
            genericNames[languageCode] <- map[OFFJson.GenericNameKey + OFFJson.KeySeparator + languageCode]
            ingredients[languageCode] <- map[OFFJson.IngredientsTextKey + OFFJson.KeySeparator + languageCode]
        }
    }
    // swiftlint:enable function-body-length

    func matchedLanguageCode(codes: [String]) -> String? {
        guard let validLanguageCodes = languageCodes else { return nil }
        for code in codes where validLanguageCodes[code] != nil {
            return code
        }
        return lang
    }

    private func decodeTypes(_ key: String, value: Any, for sizeCategory: ImageTypeCategory) -> (ImageSizeCategory, [String: String])? {
        var imageSizes: (ImageSizeCategory, [String: String])?
        if key == sizeCategory.description {
            if let imageTypesSizes = value as? [String: Any] {
                for imageTypeSize in imageTypesSizes {
                    var image = decodeTypeSizes(imageTypeSize.key, value: imageTypeSize.value, for: .display)
                    if let validImage = image {
                        imageSizes = (.display, [validImage.0: validImage.1])
                    }
                    image = decodeTypeSizes(imageTypeSize.key, value: imageTypeSize.value, for: .small)
                    if let validImage = image {
                        imageSizes = (.small, [validImage.0: validImage.1])
                    }

                    image = decodeTypeSizes(imageTypeSize.key, value: imageTypeSize.value, for: .thumb)
                    if let validImage = image {
                        imageSizes = (.thumb, [validImage.0: validImage.1])
                    }

                }
            }
        }
        return imageSizes
    }

    private func decodeTypeSizes(_ key: String, value: Any, for sizeCategory: ImageSizeCategory) -> (String, String)? {
        var image: (String, String)?
        if key == sizeCategory.description {
            if let imageTypeSizeSet = value as? [String: String] {
                for languageImage in imageTypeSizeSet {
                    image = (languageImage.key, languageImage.value)
                }
            }
        }
        return image
    }

}

extension Locale {

    static var interfaceLanguageCode: String {
        return Locale.preferredLanguages[0].split(separator: "-").map(String.init)[0]
    }

    static var countryCode: String {
        return Locale.current.identifier.split(separator: "_").map(String.init)[1]
    }

    static var preferredLanguageCodes: [String] {
        return Locale.preferredLanguages[0].split(separator: "-").map(String.init)

    }

    static var preferredLanguageCode: String {
        return Locale.preferredLanguageCodes[0]
    }

}

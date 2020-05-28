//
//  IngridentsAnalusisDetail.swift
//  API
//
//  Created by Rafal Szastok on 28/05/2020.
//

import UIKit

public final class IngredientsAnalysisDetail {
    var type: String = ""
    var icon: String = ""
    var title: String = ""
    var tag: String = ""

    /// name of type (vegan, vegetarian, palm oil" translated in the user language
    var typeDisplayName: String?
    var showIngredientsTag: String?
}

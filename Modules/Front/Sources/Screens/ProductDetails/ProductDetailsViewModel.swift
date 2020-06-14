//
//  ProductDetailsViewModel.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 04/06/2020.
//

import API
import Services
import UIKit

final class ProductDetailsViewModel {
    typealias Dependencies = HomeNavigationServiceContainer
    private let product: Product
    init(product: Product) {
        self.product = product
    }

    var title: String {
        return product.productName ?? ""
    }

    var nutritionScore: Int? {
        return product.nutriscoreScore
    }

    var images: [URL] {
        return product
            .imagesUrlDictionary
            .compactMap { (key, value) -> (Int, URL)? in
                guard let url = URL(string: value) else {
                    return nil
                }
                return (key.priority, url)
            }
            .sorted { (first, second) -> Bool in
                first.0 > second.0
            }
            .map { $0.1 }

    }
}

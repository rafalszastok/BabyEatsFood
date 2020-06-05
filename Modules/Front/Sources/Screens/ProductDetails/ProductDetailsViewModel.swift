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

    var images: [URL] {
        return product.imagesUrlDictionary.values.compactMap(URL.init(string:))
    }
}

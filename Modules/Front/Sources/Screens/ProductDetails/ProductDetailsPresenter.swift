//
//  ProductDetailsPresenter.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 05/06/2020.
//

import UIKit
import API

enum ProductDetailsPresenter {
    static func make(
        with dependencies: ProductDetailsViewModel.Dependencies,
        product: Product)
        -> ProductDetailsViewController {

        let storyboard = UIStoryboard(name: "ProductDetails", bundle: nil)
        let viewController: ProductDetailsViewController = storyboard.instantiateViewController()
            viewController.viewModel = ProductDetailsViewModel(product: product)
        return viewController
    }
}

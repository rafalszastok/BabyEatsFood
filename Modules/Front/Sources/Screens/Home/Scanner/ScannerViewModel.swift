//
//  ScannerViewModel.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 25/05/2020.
//

import Foundation
import API
import Services

public final class ScannerViewModel {

    typealias Dependencies = HomeNavigationServiceContainer & ProductServiceContainer

    let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func found(barCode: String) {
        // 070177029630
        // 0009800895007
        dependencies.productService.product(
            productId: barCode,
            onComplete: handle(productResult:))
    }

    private func handle(productResult: ProductService.ProductResult) {
        switch productResult {
        case .failure(let error):
            print("Error occured \(error)")
        case .success(let productResponse):
            dependencies.homeNavigationService.presentDetails(for: productResponse.product)
        }
    }
}

//
//  ScannerViewModel.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 25/05/2020.
//

import API
import Combine
import Foundation
import Services

public final class ScannerViewModel {

    typealias Dependencies = HomeNavigationServiceContainer & ProductServiceContainer

    let dependencies: Dependencies
    var subscriptions = Set<AnyCancellable>()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func found(barCode: String) {
        // 070177029630
        // 0009800895007
        dependencies.productService
            .product(productId: barCode)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            }, receiveValue: {
                [weak self]
                productResponse in
                if let product = productResponse.product {
                    self?.dependencies.homeNavigationService.presentDetails(for: product)
                } else {
                    print("Handle: show error product not found")
                }
            })
            .store(in: &subscriptions)
    }

}

//
//  MainServicesContainer.swift
//  API
//
//  Created by Rafal Szastok on 04/06/2020.
//

import Services

final class MainServicesContainer: ProductServiceContainer, HomeNavigationServiceContainer {
    let productService: ProductService
    let homeNavigationService: HomeNavigationService

    init() {
        productService = ConcreteProductService()
        homeNavigationService = ConcreteHomeNavigationService()
    }
}

//
//  MainServicesContainer.swift
//  API
//
//  Created by Rafal Szastok on 04/06/2020.
//

import Services

final class MainServicesContainer: ProductServiceContainer {
    let productService: ProductService

    init() {
        productService = ConcreteProductService()
    }
}

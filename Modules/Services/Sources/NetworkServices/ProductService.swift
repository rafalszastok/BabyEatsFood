//
//  ProductService.swift
//  Services
//
//  Created by Rafal Szastok on 04/06/2020.
//

import API
import Combine
import OpenFoodFactsNetwork
import Swinject

public enum ProductServiceError: Error {
    case mappingError
    case networkError(NetworkError)
    case productNotFound
}

public protocol ProductService {
    typealias ProductResult = Result<Product, ProductServiceError>
    func product(productId: String) -> AnyPublisher<ProductResponse, ProductServiceError>
}

public protocol ProductServiceContainer {
    var productService: ProductService { get }
}

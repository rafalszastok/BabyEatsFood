//
//  ProductService.swift
//  Services
//
//  Created by Rafal Szastok on 04/06/2020.
//

import API
import Combine
import OpenFoodFactsNetwork

public enum ProductServiceError: Error {
    case mappingError
    case networkError(NetworkError)
    case productNotFound
}

public protocol ProductService {
    func product(productId: String) -> AnyPublisher<ProductResponse, ProductServiceError>
}

public protocol ProductServiceContainer {
    var productService: ProductService { get }
}

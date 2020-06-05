//
//  ConcreteProductProvider.swift
//  API
//
//  Created by Rafal Szastok on 04/06/2020.
//

import API
import Combine
import Foundation
import Network

public final class ConcreteProductService: ProductService {

    private let productProvider = ProductProvider(session: URLSession.shared)
    private let languageCode: String

    public init(languageCode: String) {
        self.languageCode = languageCode
    }

    public func product(productId: String) -> AnyPublisher<ProductResponse, ProductServiceError> {
        let rx = productProvider
            .obtainProduct(languageCode: "es", productId: productId)
            .mapError { entityError -> ProductServiceError in
                switch entityError {
                case .mappingError:
                    return ProductServiceError.mappingError
                case .invalidHttpResponse(let urlResponse):
                    return ProductServiceError.networkError(NetworkError.noInternetConnection)
                case .dataTask(let error):
                    return ProductServiceError.networkError(NetworkError.noInternetConnection)
                }
            }
        return AnyPublisher(rx)
    }
}

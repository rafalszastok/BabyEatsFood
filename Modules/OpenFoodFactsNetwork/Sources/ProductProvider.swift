//
//  ApiError.swift
//  API
//
//  Created by Rafal Szastok on 28/05/2020.
//

import API
import Combine
import Foundation

public enum NetworkError: Error {
    case unexpectedResponseType(urlResponse: URLResponse?)
    case requestFailed(error: Error)
    case httpError
    case noInternetConnection
    case parsingFailed(error: Error)
}

public final class ProductProvider {
    private let entityProvider: EntityProvider<ProductResponse>
    private let jsonDecoder = JSONDecoder()

    public init(session: URLSession = URLSession.shared) {
        self.entityProvider = EntityProvider<ProductResponse>(session: session)
    }

    public func obtainProduct(languageCode: String, productId: String) -> AnyPublisher<ProductResponse, EntityError> {

        let urlString = "https://\(languageCode).openfoodfacts.org/api/v0/product/\(productId).json"
        guard let url = URL(string: urlString) else {
            return AnyPublisher<ProductResponse, EntityError>(Empty<ProductResponse, EntityError>())
        }

        let urlRequest = URLRequest(url: url)
        return entityProvider.obtain(urlRequest: urlRequest)
    }
}

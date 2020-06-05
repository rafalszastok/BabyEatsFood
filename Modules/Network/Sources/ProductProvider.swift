//
//  ApiError.swift
//  API
//
//  Created by Rafal Szastok on 28/05/2020.
//

import API
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

    public typealias ProductResult = Result<ProductResponse, NetworkError>
    public typealias OnCompleteAction = (ProductResult) -> Void

    public init(session: URLSession = URLSession.shared) {
        self.entityProvider = EntityProvider<ProductResponse>(session: session)
    }

    public func obtainProduct(languageCode: String, productId: String, onComplete: @escaping OnCompleteAction) {

        let urlString = "https://\(languageCode).openfoodfacts.org/api/v0/product/\(productId).json"
        guard let url = URL(string: urlString) else {
            return
        }

        let urlRequest = URLRequest(url: url)
        entityProvider.obtain(urlRequest: urlRequest, onComplete: onComplete)
    }
}

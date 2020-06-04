//
//  ConcreteProductProvider.swift
//  API
//
//  Created by Rafal Szastok on 04/06/2020.
//

import Foundation
import Network

public final class ConcreteProductProvider: ProductService {

    private let productProvider = ProductProvider(session: URLSession.shared)

    public init() {}

    public func product(productId: String, onComplete: @escaping OnCompleteAction) {
        productProvider.obtainProduct(productId: productId, onComplete: onComplete)
    }
}

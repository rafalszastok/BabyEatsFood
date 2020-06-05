//
//  ConcreteHomeNavigationService.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 05/06/2020.
//

import API
import Combine
import Foundation

final class ConcreteHomeNavigationService: HomeNavigationService {

    private let productPassthroughSubject = PassthroughSubject<Product, Never>()

    var productSelectedPublisher: AnyPublisher<Product, Never> {
        return AnyPublisher(productPassthroughSubject)
    }

    func presentDetails(for product: Product) {
        productPassthroughSubject.send(product)
    }

}

//
//  HomeNavigationService.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 05/06/2020.
//

import Foundation
import API
import Combine

protocol HomeNavigationService {
    var productSelectedPublisher: AnyPublisher<Product, Never> { get }
    func presentDetails(for product: Product)
}

protocol HomeNavigationServiceContainer {
    var homeNavigationService: HomeNavigationService { get }
}

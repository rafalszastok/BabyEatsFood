//
//  ProductService.swift
//  Services
//
//  Created by Rafal Szastok on 04/06/2020.
//

import API
import Network
import Swinject

public protocol ProductService {

    typealias OnCompleteAction = ProductProvider.OnCompleteAction

    func product(productId: String, onComplete: @escaping OnCompleteAction)
}
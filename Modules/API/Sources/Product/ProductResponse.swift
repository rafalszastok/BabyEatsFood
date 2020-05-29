//
//  ProductResponse.swift
//  API
//
//  Created by Rafal Szastok on 29/05/2020.
//

import Foundation

struct ProductResponse: Codable {
    let code: String
    let product: Product
    let status: Int
    let statusVerbose: String

    enum CodingKeys: String, CodingKey {
        case code, product, status
        case statusVerbose = "status_verbose"
    }
}

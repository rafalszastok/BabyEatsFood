//
//  ProductResponse.swift
//  API
//
//  Created by Rafal Szastok on 29/05/2020.
//

import Foundation

public struct ProductResponse: Codable {
    public let code: String
    public let product: Product
    public let status: Int
    public let statusVerbose: String

    enum CodingKeys: String, CodingKey {
        case code, product, status
        case statusVerbose = "status_verbose"
    }
}

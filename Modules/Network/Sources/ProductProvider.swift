//
//  ApiError.swift
//  API
//
//  Created by Rafal Szastok on 28/05/2020.
//

import API
import Foundation

public final class ProductProvider {
    let session: URLSession
    let jsonDecoder = JSONDecoder()

    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    public func obtainProduct(productId: String) {
        let session = URLSession.shared
        let url = URL(string: "https://learnappmaking.com/ex/users.json")!
        let task = session.dataTask(
            with: url,
            completionHandler: {
                [weak self]
                data, response, error in
                guard let data = data else {
                    return
                }
                let result = try? self?.jsonDecoder.decode(Product.self, from: data)

                print("Result is \(result)")
                
        })
        task.resume()
    }
}

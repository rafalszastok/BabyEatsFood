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

    public func obtainProduct(productId: String) {//0009800895007
        let session = URLSession.shared
        let url = URL(string: "https://es.openfoodfacts.org/api/v0/product/0009800895007.json")!
        let task = session.dataTask(
            with: url,
            completionHandler: {
                data, urlResponse, error in

                print("Url response is \(urlResponse)")
                guard let data = data else {
                    print(error)
                    return
                }
                ProductProvider.handle(data: data, jsonDecoder: self.jsonDecoder)

        })
        task.resume()
    }

    private static func handle(data: Data, jsonDecoder: JSONDecoder) {
        print("Handle data called")
        let str = String(decoding: data, as: UTF8.self)
        print("Data is \(str)")

        do {
            let result = try jsonDecoder.decode(Product.self, from: data)
            print("Result is \(result)")
        }
        catch {
            print(error)
        }
    }
}

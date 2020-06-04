//
//  EntityProvider.swift
//  API
//
//  Created by Rafal Szastok on 04/06/2020.
//

import Foundation

public final class EntityProvider<EntityType: Decodable> {

    public typealias EntityResult = Result<EntityType, NetworkError>
    public typealias OnCompleteAction = (EntityResult) -> Void
    private typealias OnNetworkCompleted = (Result<Data, NetworkError>) -> Void

    private let session: URLSession
    private let jsonDecoder = JSONDecoder()

    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    public func obtain(urlRequest: URLRequest, onComplete: @escaping OnCompleteAction) {

        performRequest(urlRequest: urlRequest, onNetworkComplete: {
            [weak self] result in

            guard let self = self else {
                return
            }

            switch result {

            case .failure(let networkError):
                DispatchQueue.main.async {
                    onComplete(.failure(networkError))
                }

            case .success(let data):
                let decodingResult = self.decode(data: data)
                DispatchQueue.main.async {

                    switch decodingResult {
                    case .failure(let error):
                        onComplete(.failure(.parsingFailed(error: error)))
                    case .success(let product):
                        onComplete(.success(product))
                    }

                }
            }
        })
    }

    private func performRequest(urlRequest: URLRequest, onNetworkComplete: @escaping OnNetworkCompleted) {
        let task = session.dataTask(
            with: urlRequest,
            completionHandler: {
                data, urlResponse, error in

                if let error = error {
                    onNetworkComplete(.failure(.requestFailed(error: error)))
                    return
                }

                guard urlResponse is HTTPURLResponse,
                    let data = data else {
                    onNetworkComplete(.failure(.unexpectedResponseType(urlResponse: urlResponse)))
                    return
                }
                onNetworkComplete(.success(data))
        })
        task.resume()
    }

    private func decode(data: Data) -> Result<EntityType, Error> {

        let str = String(decoding: data, as: UTF8.self)
        print("Data is \(str)")

        do {
            let product = try jsonDecoder.decode(EntityType.self, from: data)
            return .success(product)
        } catch {
            return .failure(error)
        }
    }
}

//
//  EntityProvider.swift
//  API
//
//  Created by Rafal Szastok on 04/06/2020.
//

import API
import Combine
import Foundation

public enum EntityError: Error {
    case mappingError
    case invalidHttpResponse(URLResponse)
    case dataTask(error: Error)
}

public final class EntityProvider<EntityType: Decodable> {

    public typealias EntityResult = Result<EntityType, NetworkError>
    public typealias OnCompleteAction = (EntityResult) -> Void

    private let session: URLSession
    private let jsonDecoder = JSONDecoder()

    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    public func obtain(urlRequest: URLRequest) -> AnyPublisher<EntityType, EntityError> {
        let reactiveSequence = session
            .dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200
                else {
                    throw EntityError.invalidHttpResponse(response)
                }
                return data
            }
            .decode(type: EntityType.self, decoder: self.jsonDecoder)
            .mapError { dataTaskError -> EntityError in
                EntityError.dataTask(error: dataTaskError)
            }
            .receive(on: RunLoop.main)
        return AnyPublisher<EntityType, EntityError>(reactiveSequence)
    }

}

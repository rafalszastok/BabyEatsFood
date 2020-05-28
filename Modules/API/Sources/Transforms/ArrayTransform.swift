//
//  ArrayTransform.swift
//  API
//
//  Created by Rafal Szastok on 28/05/2020.
//

import Foundation

import ObjectMapper

public final class ArrayTransform: TransformType {
    public typealias Object = [String]?
    public typealias JSON = String

    public func transformFromJSON(_ value: Any?) -> Object? {
        if let value = value as? String, !value.isEmpty {
            return value.components(separatedBy: ",").map { $0.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) }
        }

        return nil
    }

    public func transformToJSON(_ value: Object?) -> JSON? {
        if let value = value {
            return value?.joined(separator: ",")
        }

        return nil
    }
}

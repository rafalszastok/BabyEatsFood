//
//  TagTransform.swift
//  API
//
//  Created by Rafal Szastok on 28/05/2020.
//

import Foundation

import ObjectMapper

public final class TagTransform: TransformType {
    public typealias Object = [Tag]
    public typealias JSON = [String]

    public func transformFromJSON(_ value: Any?) -> Object? {
        if let tagList = value as? [String] {
            var tags = [Tag]()
            for tag in tagList {
                let split = tag.components(separatedBy: ":")
                tags.append(Tag(languageCode: split[0], value: split[1]))
            }

            return tags
        }

        return nil
    }

    public func transformToJSON(_ value: Object?) -> JSON? {
        if let tags = value {
            var tagList = [String]()
            for tag in tags {
                tagList.append("\(tag.languageCode):\(tag.value)")
            }

            return tagList
        }

        return nil
    }
}

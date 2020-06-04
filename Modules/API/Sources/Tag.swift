//
//  Tag.swift
//  API
//
//  Created by Rafal Szastok on 28/05/2020.
//

import Foundation

public final class Tag {
    public var languageCode: String = ""
    public var value: String = ""

    public convenience init(languageCode: String, value: String) {
        self.init()
        self.languageCode = languageCode
        self.value = value
    }

    /// choose the most appropriate tags based on the language passed in parameters, default to english if not found
    static func choose(inTags tags: [Tag], forLanguageCode languageCode: String? = nil, defaultToFirst: Bool = false) -> Tag? {
        let lang = languageCode ?? Bundle.main.preferredLocalizations.first ?? "en"

        if let tag = tags.first(where: { (tag: Tag) -> Bool in
            tag.languageCode == lang
        }) {
            return tag
        }

        if lang != "en" {
            return choose(inTags: tags, forLanguageCode: "en", defaultToFirst: defaultToFirst)
        }

        if defaultToFirst {
            return tags.first
        }

        return nil
    }
}

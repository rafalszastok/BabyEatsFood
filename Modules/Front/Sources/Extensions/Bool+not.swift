//
//  Bool+not.swift
//  API
//
//  Created by Rafal Szastok on 04/06/2020.
//

import Foundation

public extension Bool {

    var not: Bool {
        return !self
    }

    var isFalse: Bool {
        return self == false
    }

    var isTrue: Bool {
        return self == true
    }
}

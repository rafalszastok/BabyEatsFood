//
//  ShittyExtensions.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 20/05/2020.
//

import Foundation

extension Array {
    public mutating func append(_ newElement: Element?) {
        if let element = newElement {
            self.append(element)
        }
    }
}

public final class Logger {
    func error(_ message: String) {
        print(message)
    }
    func error(_ nserror: NSError) {
        print(nserror)
    }
    func error(_ error: Error) {
        print(error)
    }

}
let log = Logger()

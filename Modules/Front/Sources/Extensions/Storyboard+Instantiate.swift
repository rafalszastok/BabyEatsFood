//
//  Storyboard+Instantiate.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 04/06/2020.
//

import UIKit

public extension UIStoryboard {

    func instantiateViewController<T: UIViewController>(
        ofType type: T.Type = T.self, customIdentifier: String? = nil) -> T {

        let identifier = customIdentifier ?? String(describing: type)

        // swiftlint:disable:next force_cast
        let viewController = instantiateViewController(withIdentifier: identifier) as! T

        return viewController
    }

    func instantiateInitialViewController<T: UIViewController>(
        ofType type: T.Type = T.self, customIdentifier: String? = nil) -> T {

        // swiftlint:disable:next force_cast
        let viewController = instantiateInitialViewController() as! T
        return viewController
    }
}

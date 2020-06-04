//
//  HomeTabbarPresenter.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 04/06/2020.
//

import UIKit

enum HomeTabbarPresenter {

    static func make() -> UITabBarController {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        return storyboard.instantiateInitialViewController()
    }
}

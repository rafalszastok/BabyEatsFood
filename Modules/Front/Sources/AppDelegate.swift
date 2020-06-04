//
//  AppDelegate.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 19/05/2020.
//  Copyright © 2020 Rafal Szastok. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var flowRouter: FlowRouter!

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?)
        -> Bool {

        let window = UIWindow()
        self.window = window
        flowRouter = FlowRouter(window: window)
        flowRouter.presentHomePage()
        return true
    }

    func application(
        _: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options _: UIScene.ConnectionOptions)
        -> UISceneConfiguration {

        return UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role)
    }

}

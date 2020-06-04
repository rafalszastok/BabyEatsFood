//
//  SceneDelegate.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 19/05/2020.
//  Copyright © 2020 Rafal Szastok. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var flowRouter: FlowRouter!

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene else {
            return
        }

        let window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window.windowScene = windowScene
        self.window = window

        flowRouter = FlowRouter(window: window)
        flowRouter.presentHomePage()
    }

    func sceneDidDisconnect(_: UIScene) {}

    func sceneDidBecomeActive(_: UIScene) {}

    func sceneWillResignActive(_: UIScene) {}

    func sceneWillEnterForeground(_: UIScene) {}

    func sceneDidEnterBackground(_: UIScene) {}
}

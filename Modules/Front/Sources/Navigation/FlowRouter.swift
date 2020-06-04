//
//  FlowRouter.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 04/06/2020.
//

import UIKit

final class FlowRouter {
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func presentHomePage() {
        self.window.makeKeyAndVisible()
        let homeTabbar = HomeTabbarPresenter.make()
        let scannerViewController = homeTabbar.viewControllers![0] as! ScannerViewController

        guard let captureSessionResult = CaptureSessionFactory.make(delegate: scannerViewController) else {
            assertionFailure("Cannot make capture session")
            return
        }
        scannerViewController.inject(captureSessionResult: captureSessionResult)
        self.window.rootViewController = homeTabbar
    }
}

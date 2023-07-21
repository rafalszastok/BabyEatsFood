//
//  HomeTabbarPresenter.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 04/06/2020.
//

import UIKit

enum HomeTabbarPresenter {

    static func make(with dependencies: ScannerViewModel.Dependencies) -> UITabBarController? {

        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let homeTabbar: UITabBarController = storyboard.instantiateInitialViewController()

        let scannerViewController = homeTabbar.viewControllers![0] as! ScannerViewController

        let audioVideoCaptureWrapper = AudioVideoCaptureWrapperFactory
            .make(delegate: scannerViewController)
        let viewModel = ScannerViewModel(dependencies: dependencies)
        scannerViewController.inject(
            viewModel: viewModel,
            audioVideoCaptureWrapper: audioVideoCaptureWrapper)

        return homeTabbar
    }
}

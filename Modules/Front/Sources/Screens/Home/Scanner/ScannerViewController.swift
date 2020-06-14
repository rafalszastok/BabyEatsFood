//
//  FirstViewController.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 19/05/2020.
//  Copyright © 2020 Rafal Szastok. All rights reserved.
//

import API
import AVFoundation
import OpenFoodFactsNetwork
import Swinject
import UIKit

final class ScannerViewController: UIViewController {
    let productProvider = ProductProvider()
    var audioVideoCaptureWrapper: AudioVideoCaptureWrapper!
    var viewModel: ScannerViewModel!
    var dependencies: Dependencies!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        audioVideoCaptureWrapper.insertPreviewLayer(to: view)
        audioVideoCaptureWrapper.startCaptureSessionIfNeeded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.found(barCode: "5900617034786")
        return

            audioVideoCaptureWrapper.startCaptureSessionIfNeeded()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        audioVideoCaptureWrapper.stopCaptureSessionIfNeeded()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    func inject(
        viewModel: ScannerViewModel,
        audioVideoCaptureWrapper: AudioVideoCaptureWrapper) {

        self.viewModel = viewModel
        self.audioVideoCaptureWrapper = audioVideoCaptureWrapper
    }
}

extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {

        guard let metadataObject = metadataObjects.first,
            let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject,
            let stringValue = readableObject.stringValue else {

            return
        }

        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        viewModel.found(barCode: stringValue)
        audioVideoCaptureWrapper.stopCaptureSessionIfNeeded()
        let dispatchTime = DispatchTime.now() + DispatchTimeInterval.milliseconds(3000)
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            [weak self] in
            self?.audioVideoCaptureWrapper.startCaptureSessionIfNeeded()

        }
    }
}

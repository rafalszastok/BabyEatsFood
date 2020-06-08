//
//  FirstViewController.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 19/05/2020.
//  Copyright © 2020 Rafal Szastok. All rights reserved.
//

import API
import AVFoundation
import Network
import Swinject
import UIKit

final class ScannerViewController: UIViewController {
    let productProvider = ProductProvider()

    var viewModel: ScannerViewModel!
    var dependencies: Dependencies!
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        previewLayer.frame = view.layer.bounds
        view.layer.addSublayer(previewLayer)
        captureSession.startRunning()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if captureSession.isRunning.not {
            captureSession.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if captureSession.isRunning {
            captureSession.stopRunning()
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    func inject(
        viewModel: ScannerViewModel,
        captureSessionResult: CaptureSessionFactory.ConstructionResult) {

        self.viewModel = viewModel
        captureSession = captureSessionResult.captureSession
        previewLayer = captureSessionResult.previewLayer
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
        captureSession.stopRunning()
        let dispatchTime = DispatchTime.now() + DispatchTimeInterval.milliseconds(3000)
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            [weak self] in
            self?.captureSession.startRunning()

        }
    }
}

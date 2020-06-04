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
import UIKit

final class ScannerViewController: UIViewController {
    let productProvider = ProductProvider()
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    typealias ConstructionResult = (
        captureSession: AVCaptureSession,
        previewLayer: AVCaptureVideoPreviewLayer)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black

        let result = ScannerViewController.makeCaptureSession(
            viewBounds: view.layer.bounds,
            delegate: self)

        captureSession = result?.captureSession
        previewLayer = result?.previewLayer

        view.layer.addSublayer(previewLayer)
        result?.captureSession.startRunning()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if captureSession?.isRunning == false {
            captureSession.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if captureSession?.isRunning == true {
            captureSession.stopRunning()
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    func found(barCode: String) {
        // 070177029630
        // 0009800895007
        print("Found bar code \(barCode)")
        productProvider.obtainProduct(
            productId: barCode,
            onComplete: {
                [weak self] result in

                switch result {
                case .failure(let error):
                    print("Error occured \(error)")
                case .success(let productResponse):
                    let ac = UIAlertController(
                        title: "Scanning found product",
                        message: productResponse.product.productName,
                        preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(ac, animated: true)
                }
        })
    }

    private static func makeCaptureSession(
        viewBounds: CGRect,
        delegate: AVCaptureMetadataOutputObjectsDelegate) -> ConstructionResult? {

        let captureSession = AVCaptureSession()

        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            assertionFailure("Cannot create capture device")
            return nil
        }
        guard let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice) else {
            assertionFailure("Cannot create capture device input")
            return nil
        }

        guard captureSession.canAddInput(videoInput) else {
            assertionFailure("Cannot add video input to session")
            return nil
        }
        captureSession.addInput(videoInput)

        let metadataOutput = AVCaptureMetadataOutput()

        guard captureSession.canAddOutput(metadataOutput) else {
            assertionFailure("Cannot add output to session")
            return nil
        }
        captureSession.addOutput(metadataOutput)
        metadataOutput.setMetadataObjectsDelegate(delegate, queue: DispatchQueue.main)
        metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417]

        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = viewBounds
        previewLayer.videoGravity = .resizeAspectFill

        return (captureSession: captureSession, previewLayer: previewLayer)
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
        found(barCode: stringValue)
        captureSession.stopRunning()
        let dispatchTime = DispatchTime.now() + DispatchTimeInterval.milliseconds(3000)
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            [weak self] in
            self?.captureSession.startRunning()

        }
    }
}

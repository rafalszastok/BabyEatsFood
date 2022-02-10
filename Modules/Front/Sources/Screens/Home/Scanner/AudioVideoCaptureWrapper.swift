//
//  CaptureSessionWrapper.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 13/06/2020.
//

import AVFoundation
import UIKit

final class AudioVideoCaptureWrapper {
    private let captureSession: AVCaptureSession?
    private let previewLayer: AVCaptureVideoPreviewLayer?

    init(
        captureSession: AVCaptureSession?,
        previewLayer: AVCaptureVideoPreviewLayer?)
    {
        self.captureSession = captureSession
        self.previewLayer = previewLayer
    }

    func startCaptureSessionIfNeeded() {
        guard let captureSession = captureSession else {
            return
        }
        guard captureSession.isRunning else {
            return
        }
        captureSession.startRunning()
    }

    func insertPreviewLayer(to view: UIView) {
        guard let previewLayer = previewLayer else {
            return
        }
        previewLayer.frame = view.layer.bounds
        view.layer.addSublayer(previewLayer)

    }

    func stopCaptureSessionIfNeeded() {
        guard let captureSession = captureSession else {
            return
        }
        guard captureSession.isRunning.not else {
            return
        }
        captureSession.stopRunning()
    }
}

enum AudioVideoCaptureWrapperFactory {
    static func make(delegate: AVCaptureMetadataOutputObjectsDelegate?)
        -> AudioVideoCaptureWrapper
    {

#if targetEnvironment(simulator)

        return AudioVideoCaptureWrapper(
            captureSession: nil,
            previewLayer: nil)
#else
        let result = CaptureSessionFactory.make(delegate: scannerViewController)
        return AudioVideoCaptureWrapper()
#endif
    }
}

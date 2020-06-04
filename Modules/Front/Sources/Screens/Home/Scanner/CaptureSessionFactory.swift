//
//  CaptureSessionFactory.swift
//  API
//
//  Created by Rafal Szastok on 04/06/2020.
//

import AVFoundation
import Foundation

enum CaptureSessionFactory {
    typealias ConstructionResult = (
        captureSession: AVCaptureSession,
        previewLayer: AVCaptureVideoPreviewLayer)

    static func make(
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
        previewLayer.videoGravity = .resizeAspectFill

        return (captureSession: captureSession, previewLayer: previewLayer)
    }
}

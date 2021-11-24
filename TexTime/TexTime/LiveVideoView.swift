//
//  LiveVideoView.swift
//  TexTime
//
//  Created by Cédric Bahirwe on 24/11/2021.
//

import SwiftUI
import AVFoundation

struct LiveVideoView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        LiveVideoViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}


fileprivate
final class LiveVideoViewController: UIViewController {
    
    var captureSession: AVCaptureSession!
    var previewLayer : AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadVideoSession()
    }
    
    private func loadVideoSession() {
        captureSession = AVCaptureSession()
        guard let videoCaptureDevice = defaultCamera() else { return }
        
        let videoInput: AVCaptureDeviceInput
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch { return  }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            didFailToLoadVideoPreview()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.frame
        previewLayer.videoGravity = .resizeAspectFill
        captureSession.startRunning()
        view.layer.addSublayer(previewLayer)
    }
    
    private func defaultCamera() -> AVCaptureDevice? {
        if let device = AVCaptureDevice.default(.builtInDualCamera,
                                                for: .video,
                                                position: .front) {
            return device
        } else if let device = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                       for: .video,
                                                       position: .front) {
            return device
        } else {
            return nil
        }
    }
    
    private func didFailToLoadVideoPreview() {
        let alertController = UIAlertController(title: "Live Video",
                                                message: "This device is not supported for Live Video Experience.",
                                                preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Got it.", style: .default)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
        captureSession = nil
    }
}

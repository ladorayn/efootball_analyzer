import Flutter
import UIKit
import Vision

class VisionOcrChannel {
    
    static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: "efootball.ocr/vision",
            binaryMessenger: registrar.messenger()
        )
        channel.setMethodCallHandler { call, result in
            if call.method == "recognizeText" {
                guard let args = call.arguments as? [String: Any],
                      let imagePath = args["imagePath"] as? String else {
                    result(FlutterError(
                        code: "INVALID_ARGS",
                        message: "imagePath required",
                        details: nil
                    ))
                    return
                }
                recognizeText(imagePath: imagePath, result: result)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    }
    
    private static func recognizeText(imagePath: String, result: @escaping FlutterResult) {
        guard let image = UIImage(contentsOfFile: imagePath),
              let cgImage = image.cgImage else {
            result(FlutterError(
                code: "IMAGE_ERROR",
                message: "Could not load image at path",
                details: imagePath
            ))
            return
        }
        
        let imageWidth = CGFloat(cgImage.width)
        let imageHeight = CGFloat(cgImage.height)
        
        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                result(FlutterError(
                    code: "VISION_ERROR",
                    message: error.localizedDescription,
                    details: nil
                ))
                return
            }
            
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                result([])
                return
            }
            
            var elements: [[String: Any]] = []
            
            for observation in observations {
                guard let candidate = observation.topCandidates(1).first else { continue }
                let text = candidate.string.trimmingCharacters(in: .whitespaces)
                if text.isEmpty { continue }
                
                // Vision returns normalized coordinates (0-1) bottom-left origin
                // Convert to pixel coordinates top-left origin for consistency
                let boundingBox = observation.boundingBox
                let x = boundingBox.minX * imageWidth
                let y = (1 - boundingBox.maxY) * imageHeight
                
                elements.append([
                    "text": text,
                    "x": x,
                    "y": y
                ])
            }
            
            // Sort by Y position top to bottom
            elements.sort { ($0["y"] as! CGFloat) < ($1["y"] as! CGFloat) }
            
            result(elements)
        }
        
        // Key settings for accuracy
        request.recognitionLevel = .accurate      // highest accuracy mode
        request.usesLanguageCorrection = false    // don't auto-correct numbers
        request.recognitionLanguages = ["en-US"]
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                DispatchQueue.main.async {
                    result(FlutterError(
                        code: "HANDLER_ERROR",
                        message: error.localizedDescription,
                        details: nil
                    ))
                }
            }
        }
    }
}
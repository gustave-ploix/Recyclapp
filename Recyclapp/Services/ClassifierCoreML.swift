//
//  ClassifierCoreML.swift
//  Recyclapp
//
//  Created by Apprenant 61 on 25/03/2022.
//

import CoreML
import Vision
import CoreImage
import SwiftUI

struct Classifier {
    
 private(set) var results: String?
    
        
    mutating func detectImage(ciImage: CIImage) {
        guard let model = try? VNCoreMLModel(for: Resnet50(configuration: MLModelConfiguration()).model)
        else {
            return
        }
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let result = request.results as? [VNClassificationObservation] else {
            return
        }
        
        if let firstResult = result.first {
            self.results = firstResult.identifier
        }
    }
    
}


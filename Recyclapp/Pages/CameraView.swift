//
//  CameraView.swift
//  Recyclapp
//
//  Created by Apprenant 61 on 23/03/2022.
//

import SwiftUI

struct CameraView: View {
    
    @State private var capturedImage: UIImage? = nil
    @State private var  isCustomCameraViewPresented = false
    
    var body: some View {
        ZStack {
         
            if capturedImage != nil {

                DescriptionView(imageShooted: $capturedImage)
                
            } else {
                // display the camera component
                CustomCameraView(capturedImage: $capturedImage)
            }
            
        } // ZStack
    } // body
} // View

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

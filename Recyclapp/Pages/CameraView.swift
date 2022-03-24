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
                Image(uiImage: capturedImage!)
                    .resizable()
                    .scaledToFill ()
                    .ignoresSafeArea()
                
                /*display a button at the top left
                 that delete the current image
                 */
                HStack {
                    VStack {
                        Button {
                            capturedImage = nil
                        } label: {
                            Image(systemName: "chevron.left.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 44))
                                .padding()
                        } // Label

                        
                        
                        Spacer() // Push to the top
                    } // hstack
                    Spacer() // push to the left
                } // vstack
                
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

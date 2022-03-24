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
            } else {
                Color(UIColor.systemBackground)
            }
            
            VStack {
                Spacer()
                Button {
                    isCustomCameraViewPresented.toggle()
                } label: {
                    Image(systemName: "camera.fill")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                .padding(.bottom)
                .sheet(isPresented: $isCustomCameraViewPresented, content: {
                    CustomCameraView(capturedImage: $capturedImage)
                })
                
            }
            
        } // ZStack
    } // body
} // View

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

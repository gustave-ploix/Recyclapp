

import SwiftUI

struct CustomCameraView: View {
    
    let cameraService = CameraSevice()
    @Binding var capturedImage: UIImage?
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        
        
        ZStack {
            
            CamView(cameraService: cameraService) { result in
                switch result {
                case .success(let photo):
                    if let data = photo.fileDataRepresentation() {
                        capturedImage = UIImage(data: data )
                    } else {
                        print("Error, no image data found")
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                } // switch__result
                
            } // CamView
            
            VStack {
                
                Spacer()
                HStack {
                    
                    //center the shutter
                    Spacer()
                    Spacer()
                    Spacer()
                    // center the shutter
                    
                    Button {
                        cameraService.capturePhoto()
                    } label: {
                        Image(systemName: "leaf.arrow.triangle.circlepath")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                            .padding()
                    } // button__label
                    
                    Spacer()
                    
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    
                } // HSTACK
            } // VStack
            
        } // ZStack
        
    } // Body
    
} // view



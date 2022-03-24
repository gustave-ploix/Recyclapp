

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
                }
                 
            }
            
            VStack {
                
                Spacer()
                
                Button {
                    cameraService.capturePhoto()
                } label: {
                    Image(systemName: "circle")
                        .font(.system(size: 70))
                        .foregroundColor(.white)
                    
                }

                
            } // VStack
            
        } // ZStack
        
    } // Body
    
} // view


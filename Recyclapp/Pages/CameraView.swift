import SwiftUI
import CoreML

struct CameraView: View {
    
    @State private var capturedImage: UIImage? = nil
    @State private var  isCustomCameraViewPresented = false
    @State private var objectType:String = ""
    
    
    
    var body: some View {
        ZStack {
            VStack {
                if capturedImage != nil {
                    PreviewImage(imageToDisplay: $capturedImage, classifier: ImageClassifier())
                } else {
                    CustomCameraView(capturedImage: $capturedImage)
                }
            }
        } // ZStack
    } // body
} // View

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

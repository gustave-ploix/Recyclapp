import SwiftUI

struct PreviewImage: View {
    @Binding var imageToDisplay: UIImage?
    
    @State var imageType: String = ""
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        
        
        VStack {
            
            
            if let image = imageToDisplay {
                
                Image(uiImage: image )
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 120)
            }
            
            ZStack {
                
                Rectangle()
                
                    .frame(height: 90)
                    .foregroundColor(.white)
                
                
                HStack {
                    Spacer()
                    
                    
                    Button {
                        imageToDisplay = nil
                    } label: {
                        Image(systemName: "chevron.backward.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.black )
                    }
                    
                    
                    Spacer()
                    
                    NavigationLink {
                        DescriptionView(imageShooted: $imageToDisplay, objectType: $imageType)
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.black)
                    }.onAppear {
                        classifier.detect(uiImage: imageToDisplay!)
                        
                        if let imageClass = classifier.imageClass {
                            print(imageClass)
                            imageType = imageClass 
                        }
                    }
                    
                    Spacer()
                    
                }
            }
            
            
        }
        
        .navigationBarHidden(true)
    }
}

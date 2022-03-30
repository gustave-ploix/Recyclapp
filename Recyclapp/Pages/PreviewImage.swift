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
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.main.bounds.height - 120)
                    .border(Color.black, width: 5)
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
                            .foregroundColor(.red )
                    }
                    
                    
                    Spacer()
                    
                    NavigationLink {
                        DescriptionView(imageShooted: $imageToDisplay, objectType: $imageType)
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.green)
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

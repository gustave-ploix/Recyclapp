//
//  PreviewImage.swift
//  Recyclapp
//
//  Created by Apprenant 61 on 25/03/2022.
//

import SwiftUI

struct PreviewImage: View {
    @Binding var imageToDisplay: UIImage?
    
    @State var imageType: String = ""
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        
        
        VStack {
            
            
            if let image = imageToDisplay {
               
                Image(uiImage: image )
//                .resizable()
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 120)
            }
            
            ZStack {
                
                Rectangle()
                    
                    .frame(height: 90)
                    .foregroundColor(.white)
                    
                
                HStack {
                    Spacer()
                    
                    
                        Button {
                            imageToDisplay = nil
                            print("blabla")
                        } label: {
                            Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.black )
                        }
                    
                    
                    Spacer()
                    
                    NavigationLink {
                        DescriptionCardComp(shootedImage: $imageToDisplay, objectType: $imageType)
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.black)
                    }.onAppear {
                        classifier.detect(uiImage: imageToDisplay!)
                        
                        if let imageClass = classifier.imageClass {
                            imageType = imageClass 
                        }
                    }
                    
                    Spacer()
                    
                }
            }
            
            
        }
    }
}

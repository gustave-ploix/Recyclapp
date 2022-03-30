//
//  DescriptionView.swift
//  Recyclapp
//
//  Created by Apprenant 61 on 23/03/2022.
//

import SwiftUI

struct DescriptionView: View {
    
    @Binding var imageShooted: UIImage?
    @Binding var objectType: String
    
    var body: some View {
        
        ZStack {
            
            BackButton()
            //                .onTapGesture {
            //                    print("image bien passée à nil")
            //                    imageShooted = nil
            //                }
            
            VStack {
                
                DescriptionCardComp(shootedImage: $imageShooted, objectType: $objectType)
                Spacer()
                ListeAdressesTrouvees(dechet: objectType)
            }
            
        }
        .background(.ultraThinMaterial)
        .navigationBarHidden(true)
    }
}

//struct DescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        DescriptionView(objectType: Binding.constant("fvsdv"))
//    }
//}

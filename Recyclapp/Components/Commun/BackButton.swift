//
//  BackButton.swift
//  Recyclapp
//
//  Created by Apprenant 61 on 29/03/2022.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        
        
        VStack {
            
            HStack {
                    
                    NavigationLink {
                        CameraView()
                    } label: {
                        Image(systemName: "chevron.backward.circle.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 30))
                            .padding()
                    }
                
                Spacer()
            } // HSTACK
            Spacer()
        } // VSTACK
    } // BODY
} // STRUCT

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}

//
//  DescriptionView.swift
//  Recyclapp
//
//  Created by Apprenant 61 on 23/03/2022.
//

import SwiftUI

struct DescriptionView: View {
    
    @Binding var imageShooted: UIImage?
    
    var body: some View {
        DescriptionCardComp(shootedImage: $imageShooted)
    }
}



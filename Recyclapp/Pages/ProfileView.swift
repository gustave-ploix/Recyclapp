//
//  ProfileView.swift
//  Recyclapp
//
//  Created by Apprenant 61 on 23/03/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            BackButton()
        VStack {
            ProfileComp()
            
            ListeFavorisTrouvees(dechet: "banana")
        }
        }
        
            .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

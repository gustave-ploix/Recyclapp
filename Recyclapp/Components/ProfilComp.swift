//
//  PageProfile.swift
//  page_profil
//
//  Created by apprenant92 on 23/03/2022.
//

import SwiftUI

struct PageProfile: View {
    
    @State private var isOn: Bool = false
    @State var name : String = ""
    
    var body: some View {
        VStack{
            HStack(){
                Image(systemName: "person.crop.circle")
                    .renderingMode(.original)
                    .resizable()
                    .padding()
                    .font(.largeTitle)
                    .frame(width: 150, height: 150)
                    .offset(x : 20)
                Button(action: {
                    // action à realiser pour que la modale soit affichée
                    isOn.toggle()
                }){Image(systemName: "pencil")
                    .foregroundColor(.black)
                    .font(.title)
                    .offset(x:10)
                }
                    .sheet(isPresented: $isOn) {
                    PageProfileModale(name: $name)
                }//Création d'un Modale qui redirige vers "PageProfileModale" avec le nom en dynamique
}//Fin HStack
            Text(name).font(.title) //Affichage du nom une fois que l'on a rempli la Modale
            Spacer()
}//Fin VStack
}//Fin body PageProfile
}//Fin Struct PageProfile


struct PageProfile_Previews: PreviewProvider {
    static var previews: some View {
        PageProfile()
            .previewInterfaceOrientation(.portrait)
    }
}
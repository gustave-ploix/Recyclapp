/*
 navigation to descriptionView and profileView
 */


import SwiftUI

struct ShutterWithProfileComp: View {
    
   
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .frame(height: 100)
                .foregroundColor(.gray  )
            
            HStack {
                
                Spacer()
                Spacer()
                
                NavigationLink(destination: DescriptionView()) {
                        Image("logo1")
                        .resizable()
                        .frame(width: 70, height: 70)
                }
                
                Spacer()
                
                NavigationLink(destination: ProfileView()) {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 50))
                        .foregroundColor(.black )
                        .padding()

                } // navLink__profileView()
                
                
            
                    
            } // HStack
        } // ZStack
    } // Body
} // Struct view

struct ShutterWithProfileComp_Previews: PreviewProvider {
    static var previews: some View {
        ShutterWithProfileComp()
    }
}

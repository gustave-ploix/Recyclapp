import SwiftUI


struct DescriptionCardComp: View {
    
    
    @Binding var shootedImage: UIImage?
    @Binding var objectType: String
    
    
    var body: some View {
        
        /*
         display a button at the top left
         that delete the current image
         */
//        ZStack {
            
//            HStack {
//                VStack {
//                    NavigationLink {
//                        CameraView()
//                    } label: {
//                        Button {
//                            shootedImage = nil
//                        } label: {
//                            Image(systemName: "chevron.left.circle.fill")
//                                .foregroundColor(.black)
//                                .font(.system(size: 44))
//                                .padding()
//                        } // Label
//                    }
//                    Spacer() // Push to the top
//                } // hstack
//                Spacer() // push to the left
//            } // vstack
            
            VStack{
                HStack{
                    Spacer()
                    Text(objectType)
                        .font(.title)
                    //L'IA est censée reconnaître le type d'objet et le désigner par un nom.
                    Spacer()

                    if let image = shootedImage {
                        Image(uiImage: image )
                            .resizable()
                            .frame(width: 100, height: 150)
                    }
                }
                
                HStack{
                    Image(systemName: "wrench.and.screwdriver.fill")
                        .font(.system(size:40))
                    VStack{
                        Text("Réparer si cassé")
                        Text("Donner si inutilisé")
                        Text("Rendre au magasin si non réparable")
                    }.font(.body) //Fin VStack Rectangle Vert
                }.padding()
                    .background(.green)
                    .ignoresSafeArea()
                Spacer()
            }//Fin VStack principale
//        } // fin ZStack
        .frame(height: UIScreen.main.bounds.height)
    }//Fin body InfoCardShootingElem
}//Fin Struct InfoCardShootingElem

//struct DescriptionCardComp_Previews: PreviewProvider {
//    static var previews: some View {
//        DescriptionCardComp()
//    }
//}

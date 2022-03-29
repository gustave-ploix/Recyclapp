import SwiftUI


struct DescriptionCardComp: View {
    
    
        @Binding var shootedImage: UIImage?
    @Binding var objectType: String
    
    
    var body: some View {
        
        
        
        VStack{
            HStack{
                Spacer()
                Text(objectType)
                    .font(.title)
                
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
            //                Spacer()
        }//Fin VStack principale
        //        } // fin ZStack
    }//Fin body InfoCardShootingElem
}//Fin Struct InfoCardShootingElem

//struct DescriptionCardComp_Previews: PreviewProvider {
//    static var previews: some View {
//        DescriptionCardComp(objectType: Binding.constant("blabla"))
//    }
//}

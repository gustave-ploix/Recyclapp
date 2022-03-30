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
            
            
            if(objectType == "desktop computer") {
                HStack{
                    Image(systemName: "wrench.and.screwdriver.fill")
                        .font(.system(size:40))
                    VStack{
                        Text("Réparer si cassé")
                        Text("Donner si inutilisé")
                        Text("Rendre au magasin si non réparable")
                    }
                        .font(.body)
                        
                    //Fin VStack Rectangle Vert
                }.frame(width: UIScreen.main.bounds.width - 50)
                .padding()
                .background(.yellow)
                .ignoresSafeArea()
            } else if (objectType == "banana") {
                HStack{
                    Image(systemName: "leaf.fill")
                        .font(.system(size:40))
                    VStack{
                        Text("Composter si possible")
                        Text("Transformer en engrais")
                    }//Fin VStack Rectangle Vert
                    .font(.body)
                    
                }.frame(width: UIScreen.main.bounds.width - 50)
                .padding()
                .background(.green)
                .ignoresSafeArea()
            } else if (objectType == "water bottle") {
                HStack{
                    Image(systemName: "trash.fill")
                        .font(.system(size:40))
                    VStack{
                        Text("Poubelle de recyclage")
                        Text("Transformer en pot de fleurs")
                        Text("Acheter une bouteille en métal")
                    }//Fin VStack Rectangle Vert
                    .font(.body)
                    
                }.frame(width: UIScreen.main.bounds.width - 50)
                .padding()
                .background(.red)
                .ignoresSafeArea()
            }
            
        }//Fin VStack principale
    }//Fin body InfoCardShootingElem
}//Fin Struct InfoCardShootingElem



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
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                }
                
            }.padding()
            
            
            if(objectType == "desktop computer") {
                HStack{
                    Image(systemName: "wrench.and.screwdriver.fill")
                        .font(.system(size:40))
                    Spacer()
                    VStack{
                        Text("Réparer si cassé")
                        Text("Donner si inutilisé")
                        Text("Rendre au magasin si non réparable")
                    }
                        .font(.body)
                    Spacer()
                        
                    //Fin VStack Rectangle Vert
                }.frame(width: UIScreen.main.bounds.width - 65)
                .padding()
                .background(.yellow)
                .ignoresSafeArea()
            } else if (objectType == "banana") {
                HStack{
                    Image(systemName: "leaf.fill")
                        .font(.system(size:40))
                    Spacer()
                    VStack{
                        Text("Composter si possible")
                        Text("Transformer en engrais")
                    }//Fin VStack Rectangle Vert
                    .font(.body)
                    Spacer()
                    
                }.frame(width: UIScreen.main.bounds.width - 65)
                .padding()
                .background(.green)
                .ignoresSafeArea()
            } else if (objectType == "water bottle") {
                HStack{
                    Image(systemName: "trash.fill")
                        .font(.system(size:40))
                    Spacer()
                    VStack{
                        Text("Poubelle de recyclage")
                        Text("Transformer en pot de fleurs")
                        Text("Acheter une bouteille en métal")
                    }//Fin VStack Rectangle Vert
                    .font(.body)
                    Spacer()
                    
                }.frame(width: UIScreen.main.bounds.width - 65)
                .padding()
                .background(.red)
                .ignoresSafeArea()
            } else if (objectType == "projectile, missile") {
                HStack{
                    Image(systemName: "dollarsign.circle.fill")
                        .font(.system(size:40))
                    Spacer()
                    VStack{
                        Text("le lancer sur la banque")
                        Text("Fabriquer un briquet")
                        Text("Le lancer sur Zemmour")
                    }//Fin VStack Rectangle Vert
                    .font(.body)
                    Spacer()
                    
                }.frame(width: UIScreen.main.bounds.width - 65)
                .padding()
                .background(.red)
                .ignoresSafeArea()
            } else {
                NotFoundComp()
            }
            
        }//Fin VStack principale
    }//Fin body InfoCardShootingElem
}//Fin Struct InfoCardShootingElem



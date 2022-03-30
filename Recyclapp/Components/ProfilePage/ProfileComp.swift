import SwiftUI

struct ProfileComp: View {
    
    @State private var isOn: Bool = false
    @State var userName : String = ""
    
    @AppStorage("Username") var name = ""
    
    @AppStorage("red") var red = 0.0
    @AppStorage("green") var green = 0.0
    @AppStorage("blue") var blue = 0.0
    
    
    var body: some View {
        VStack{
            HStack(){
                Image(systemName: "person.crop.circle")
                    .padding()
                    .font(.system(size: 150))
                    .foregroundColor(Color(red: red, green: green, blue: blue))
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
                    PageProfileModale(name: $name, red: $red, green: $green, blue: $blue)
                }
                
                //Création d'un Modale qui redirige vers "PageProfileModale" avec le nom en dynamique
            }//Fin HStack
            Text(name)
                .font(.title)//Affichage du nom une fois que l'on a rempli la Modale
            
            //            Spacer()
        }//Fin VStack
    }//Fin body PageProfile
}//Fin Struct PageProfile


struct ProfileComp_Previews: PreviewProvider {
    static var previews: some View {
        ProfileComp()
            .previewInterfaceOrientation(.portrait)
    }
}


import SwiftUI

struct PageProfileModale: View {
    
    @Binding var name: String
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    presentation.wrappedValue.dismiss()
                    name = ""
                }) {
                    Image(systemName: "x.circle.fill")
                        .font(.largeTitle)
                }
            }.padding(.horizontal, 20)
            Form {
                
                TextField("Votre nom", text: $name)
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }) {
                        Text("Confirmer")
                    }
                    Spacer()
                }
            }.navigationTitle("Add Name")
        }
    }
}

struct PageProfileModale_Previews: PreviewProvider {
    static var previews: some View {
        PageProfileModale(name: .constant("Votre nom"))
    }
}

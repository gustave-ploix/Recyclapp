
import SwiftUI

struct PageProfileModale: View {
    
    @Binding var name: String
    @Environment(\.presentationMode) var presentation
    
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    
    func roundValue(value: Double) -> Double {
            return Double(round(100 * value) / 100)
            
        } // FUNC
    
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
            
            Image(systemName: "person.crop.circle")
                .padding()
                .font(.system(size: 150))
                .foregroundColor(Color(red: red, green: green, blue: blue, opacity: 1.0))
                .foregroundColor(.black)
            Form {
                
                TextField("Votre nom", text: $name)
                
                ColorPicker(red: $red, green: $green, blue: $blue)
                
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
        .background(.ultraThinMaterial)
    }
}

struct PageProfileModale_Previews: PreviewProvider {
    static var previews: some View {
        PageProfileModale(name: .constant("Votre nom"), red: .constant(0.0), green: .constant(0.0), blue: .constant(0.0))
    }
}

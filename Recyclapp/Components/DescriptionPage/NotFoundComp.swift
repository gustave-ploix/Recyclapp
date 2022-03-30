import SwiftUI

extension Color {
    static let paleRed = Color("ColorTest")
}

struct NotFoundComp: View {
    var body: some View {
        ZStack {
            
        Rectangle()
            .foregroundColor(Color.paleRed)
            .frame(width: 300, height: 300)
            .cornerRadius(20)
            
            
            VStack {
                
            Text("Désolé.es !!")
                .font(.largeTitle)
                
                Text("Nous n'avons pas encore pu rentrer \r cet élément dans notre base de données")
                    .multilineTextAlignment(.center)
                    .frame(width: 280)
            }
        }
    }
}

struct NotFoundComp_Previews: PreviewProvider {
    static var previews: some View {
        NotFoundComp()
    }
}

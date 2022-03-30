import SwiftUI


struct Preloader: View {
    
    @State private var dissapear = false
    
    private func timer() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
            dissapear = true
        }
    }
    
    var body: some View {
        Image("LogoPreloader")
    }
}

struct Preloader_Previews: PreviewProvider {
    static var previews: some View {
        Preloader()
    }
}

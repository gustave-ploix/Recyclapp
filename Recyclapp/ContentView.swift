
// import CameraView from './Pages'
// import ProfileView from './Pages'
// import DescriptionView './Pages'

import SwiftUI

struct ContentView: View {
    
    @State private var isLoaded:Bool = false
    
    private func timer() {
       Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { timer in
            print("blbala")
            isLoaded = true
        }
    }
    
//    timer()
    
    var body: some View {
        NavigationView {
            
            if isLoaded {
                CameraView()
                    .navigationBarHidden(true)
            } else {
                Preloader()
                    .navigationBarHidden(true)
            }
            
        }.onAppear {
            timer()
        } // NavigationView
    } // Body
} // Struct View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

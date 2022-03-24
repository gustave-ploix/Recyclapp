
// import CameraView from './Pages'
// import ProfileView from './Pages'
// import DescriptionView './Pages'

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CameraView()
                .navigationBarHidden(true)
        } // NavigationView
    } // Body
} // Struct View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

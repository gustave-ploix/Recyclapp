//
//  ColorPicker.swift
//  Recyclapp
//
//  Created by Apprenant 61 on 30/03/2022.
//

import SwiftUI

struct ColorPicker: View {
    
    @Binding var red:Double
    @Binding var green:Double
    @Binding var blue:Double
    
    var body: some View {
        
        VStack {
            Text("red")
            Slider(value: $red, in: 0...1)
            
            Text("green")
            Slider(value: $green, in: 0...1)
            
            Text("blue")
            Slider(value: $blue, in: 0...1)
        }
        
    }
}

struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker(red: .constant(0.0), green: .constant(0.0), blue: .constant (0.0))
    }
}

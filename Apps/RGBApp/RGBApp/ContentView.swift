//
//  ContentView.swift
//  RGBApp
//
//  Created by 19072382 on 29.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State var redComponent: Double = 0.5
    @State var greenComponent: Double = 0.5
    @State var blueComponent: Double = 0.5
    
    var body: some View {
        VStack {
            Slider(value: $redComponent)
                .padding(.vertical, 50.0)
            Slider(value: $greenComponent)
                .padding(.bottom, 50.0)
            Slider(value: $blueComponent)
                .padding(.bottom, 20.0)
            Color(red: redComponent, green: greenComponent, blue: blueComponent)
        }
        .padding(.all, 10.0)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

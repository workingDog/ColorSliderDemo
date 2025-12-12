//
//  ContentView.swift
//  ColorSliderDemo
//
//  Created by Ringo Wathelet on 2025/11/12.
//

import SwiftUI
import ColorSlider


struct ContentView: View {
    @Environment(ColorModel.self) var colorModel
    
    var body: some View {
        @Bindable var colorModel = colorModel
        ZStack {
            // the view background
            colorModel.color.opacity(colorModel.opacity).ignoresSafeArea()
 
            // color description
            VStack(spacing: 20) {
                Text("\(colorModel.value)")
                Text(String(colorModel.color.description))
                Circle().frame(width: 50, height: 50)
                    .overlay(Circle().stroke(Color.black,lineWidth: 2))
                    .foregroundColor(colorModel.color)
                
                HStack {
                    Text("Palette ")
                    Toggle("", isOn: $colorModel.grayScale).labelsHidden()
                    Spacer()
                }
                
                // the color Slider
                ColorSlider()
                
                // opacity Slider
                Slider(value: $colorModel.opacity, in: 0...1)
                    .tint(colorModel.color)
                    .frame(width: 333, height: 40)
                
                // save the colorModel settings to UserDefaults
                Button("Save settings") {
                    colorModel.storeSettings()
                }.buttonStyle(.borderedProminent)
 
            }
            .padding(.top, 30)
            .padding(.horizontal)
            .environment(colorModel)
        }
        .onAppear {
            colorModel.retrieveSettings()
            
            // bandSize and nColors, to modify the thickness of the color bands
//            colorModel.nColors = 10
//            colorModel.bandSize = 10
        }
    }
}

#Preview {
    ContentView()
}

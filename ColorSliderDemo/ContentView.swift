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
          //  colorModel.gradient.ignoresSafeArea()
            colorModel.color.opacity(colorModel.opacity).ignoresSafeArea()
            
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
                
                ColorSlider()
                    .accentColor(.clear)
                    .frame(width: 333, height: 40)
                    .background(colorModel.colorGradient)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1).foregroundColor(.black))
                
                Slider(value: $colorModel.opacity, in: 0...1)
                    .tint(colorModel.color)
                    .frame(width: 333, height: 40)
            }
            .padding(.top, 30)
            .padding(.horizontal)
            .environment(colorModel)
        }
        .onChange(of: colorModel.grayScale) {
            colorModel.updatePalette()
        }
        .onAppear {
            // example of using the bandSize to modify the thickness of the color bands
         //   colorModel.nColors = 10
         //   colorModel.bandSize = 10
        }
    }
}

#Preview {
    ContentView()
}

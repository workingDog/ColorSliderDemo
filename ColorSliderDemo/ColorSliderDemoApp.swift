//
//  ColorSliderDemoApp.swift
//  ColorSliderDemo
//
//  Created by Ringo Wathelet on 2025/11/12.
//
import SwiftUI
import ColorSlider

@main
struct ColorSliderDemoApp: App {
    @State var colorModel = ColorModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(colorModel)
        }
    }
}

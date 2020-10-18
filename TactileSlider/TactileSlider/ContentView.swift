//
//  ContentView.swift
//  TactileSlider
//
//  Created by Liu Chuan on 2020/5/13.
//  Copyright © 2020 Liu Chuan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    /// 百分比
    @State var percentage: Float = 50
    
    var body: some View {
        ZStack {
            // 背景色
            Color.gray.opacity(0.8).edgesIgnoringSafeArea(.all)
            
            TouchSlider(percentage: $percentage)
                .accentColor(.white)
                .frame(width: 300, height: 50)
                .offset(x: 0, y: -250)
            
            TouchSlider(percentage: $percentage)
                .accentColor(.red)
                .frame(width: 300, height: 50)
                .offset(x: 0, y: -150)
            
            
            TouchSlider(percentage: $percentage)
                .accentColor(.orange)
                .frame(width: 300, height: 50)
                .offset(x: 0, y: -50)
            
            TouchSlider(percentage: $percentage)
                .accentColor(.blue)
                .frame(width: 300, height: 50)
                .offset(x: 0, y: 50)
            
            
            TouchSlider(percentage: $percentage)
                .accentColor(.green)
                .frame(width: 300, height: 50)
                .offset(x: 0, y: 150)


            TouchSlider(percentage: $percentage)
                .accentColor(.pink)
                .frame(width: 300, height: 50)
                .offset(x: 0, y: 250)
            
            
            TouchSlider(percentage: $percentage)
                .accentColor(.purple)
                .frame(width: 300, height: 50)
                .offset(x: 0, y: 350)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

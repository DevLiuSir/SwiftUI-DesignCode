//
//  ContentView.swift
//  TactileSlider
//
//  Created by Liu Chuan on 2020/5/13.
//  Copyright © 2020 Liu Chuan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var percentage: Float = 50
    
    var body: some View {
        ZStack {
            // 背景色
            Color.gray.opacity(0.8).edgesIgnoringSafeArea(.all)
            CustomView(percentage: $percentage)
                .accentColor(.white)
                .frame(width: 300, height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

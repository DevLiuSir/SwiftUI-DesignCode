//
//  ContentView.swift
//  ParticleAnimationEffect
//
//  Created by Liu Chuan on 2020/11/09.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        
        ZStack {
            Color.black
            
            // 可以多个组合使用：红、绿、蓝
            Circle()
                .fill(Color.red)
                .frame(width: 40, height: 40)
                .modifier(ParticleEffectView(count: 100))
            
            Circle()
                .fill(Color.green)
                .frame(width: 40, height: 40)
                .modifier(ParticleEffectView(count: 100))
            
            Circle()
                .fill(Color.blue)
                .frame(width: 40, height: 40)
                .modifier(ParticleEffectView(count: 100))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

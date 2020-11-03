//
//  PulsationView.swift
//  CircleProgressBar
//
//  Created by Liu Chuan on 2020/11/2.
//

import SwiftUI

/// 脉动图层视图
struct PulsationView: View {
    
    /// 是否动画
    @State private var isAnimation = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.pulsatingFillColor)
                .frame(width: 250, height: 250)
                .scaleEffect(isAnimation ? 1.3 : 1.0)
                .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true))   // 动画结束时是否执行逆动画
                .onAppear {
                    self.isAnimation.toggle()
                }
        }
    }
}

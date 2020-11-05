//
//  RotatingDotsIndicatorView.swift
//  LoadingAnimations
//
//  Created by Liu Chuan on 2020/10/25.
//

import SwiftUI

/// 旋转点指示器
struct RotatingDotsIndicatorView: View {
    /// 圆点的个数
    private let count: Int = 5

    var body: some View {
        GeometryReader { geometry in
            // 循环创建圆点
            ForEach(0..<self.count) { index in
                RotatingDotsIndicatorItemView(index: index, size: geometry.size)
            }.frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct RotatingDotsIndicatorItemView: View {

    let index: Int
    let size: CGSize

    @State private var scale: CGFloat = 0
    @State private var rotation: Double = 0

    var body: some View {
        
        let animation = Animation
            .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
            .repeatForever(autoreverses: false)

        return Circle()
            .frame(width: size.width / 5, height: size.height / 5)
            .scaleEffect(scale)
            .offset(y: size.width / 10 - size.height / 2)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                self.rotation = 0
                self.scale = (5 - CGFloat(self.index)) / 5
                withAnimation(animation) {
                    self.rotation = 360     // 旋转360
                    self.scale = (1 + CGFloat(self.index)) / 5
                }
            }
    }
}

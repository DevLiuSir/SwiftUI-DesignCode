//
//  Shimmer.swift
//  SlideToLockState
//
//  Created by Liu Chuan on 2020/11/2.
//

import SwiftUI


/// 动画修饰器
struct Shimmer: AnimatableModifier {
    
    @State private var position: CGFloat = 0
    /// 动画持续时间
    private var duration: Double
    /// 渐变
    private let gradient: Gradient
    
    /// 初始化
    /// - Parameters:
    ///   - sideColor: 滑块颜色
    ///   - middleColor: 中间色
    ///   - animationDuration: 动画时长
    init(sideColor: Color = Color(white: 0.25), middleColor: Color = .white, animationDuration: Double = 2) {
        gradient = Gradient(colors: [sideColor, middleColor, sideColor])
        duration = animationDuration
    }
    
    var animatableData: CGFloat {
        get { position }
        set { position = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(LinearGradient(
                        gradient: gradient,
                        startPoint: .init(x: position - 0.2 * (1 - position), y: 0.5),
                        endPoint: .init(x: position + 0.2 * position, y: 0.5)))
            .mask(content)
            .onAppear {
                withAnimation(Animation
                                .linear(duration: self.duration)
                                .delay(1)
                                .repeatForever(autoreverses: false)) {
                    position = 1
                }
            }
    }
}

//
//  ParticleEffectView.swift
//  ParticleAnimationEffect
//
//  Created by Liu Chuan on 2020/11/09.
//

import SwiftUI

/// 粒子效果视图
struct ParticleEffectView: ViewModifier {
    
    /// 个数
    let count: Int
    /// 持续时间
    let duration: Double = 2.0
    /// time
    @State var time: Double = 0.0

    func body(content: Content) -> some View {
        
        let animation = Animation.linear(duration: duration).repeatForever(autoreverses: false)
        
        return ZStack {
            // 根据个数循环创建粒子
            ForEach (0..<count)  { index in
                content
                    .scaleEffect(CGFloat((duration - self.time) / duration))
                    .modifier(ParticleMotion(time: self.time))
                    .opacity((duration - self.time) / duration)                         // 透明度
                    .animation(animation.delay(Double.random(in: 0..<self.duration)))   // 延迟
                    .blendMode(.plusLighter)
            }
            .onAppear {
                withAnimation() {
                    self.time = duration
                }
            }
        }
    }
}


/// 粒子运动
struct ParticleMotion: GeometryEffect {
    
    /*
     重力场中的这种弹丸运动，但是您可以以任何可以想象的简单或疯狂的方式移动粒子
     */
    
    /// 时间
    var time: Double
    let v0: Double  = Double.random(in: 40...80)  // 初始速度，随机
    let alpha: Double = Double.random(in: 0.0 ..< 2 * Double.pi)    // 投射角度
    let g = 15 * 9.81       // 重力
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        let dx = v0 * time * cos(alpha)
        let dy = v0 * sin(alpha) * time - 0.5 * g * time * time
        let affineTransform = CGAffineTransform(translationX: CGFloat(dx), y: CGFloat(-dy))
        return ProjectionTransform(affineTransform)
    }
}

//
//  HorizontalBarView.swift
//  LoadingAnimations
//
//  Created by Liu Chuan on 2020/10/25.
//

import SwiftUI

struct HorizontalBarView: View {
    
    /// 是否处于动画状态
    @Binding var isAnimationState: Bool
    
    var body: some View {
    
        // 圆角矩形
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.purple)
            .frame(width: 100, height: 10)
            .offset(x: isAnimationState ? 100 : -100, y: 0)
            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
    }
    
}

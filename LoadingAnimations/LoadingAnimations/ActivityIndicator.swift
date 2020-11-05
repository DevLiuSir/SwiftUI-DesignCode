//
//  ActivityIndicator.swift
//  LoadingAnimations
//
//  Created by Liu Chuan on 2020/10/25.
//

import SwiftUI

/// 活动指示器
struct ActivityIndicator: View {
    
    /// 是否动画
    @Binding var isAnimationState: Bool
    
    /// 指示器个数
    var indicatorCount = 0
    
    /// 间距
    var spacing: CGFloat = 5
    
    
    var body: some View {
        
        // 水平布局
        HStack(alignment: .center, spacing: spacing) {
            // 循环创建指示器
            ForEach(0 ..< indicatorCount) { index in
                Capsule(style: .continuous)
                    .fill(Color.red)
                    .frame(width: 10, height: 50)
                    .scaleEffect(isAnimationState ? 0.5 : 1.0)
                    .animation(Animation.easeInOut(duration: 0.5)
                                .repeatForever()
                                .delay(Double(index) * 0.1)
                    )
            }
        }
    }
    
}

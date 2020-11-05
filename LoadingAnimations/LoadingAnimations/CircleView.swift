//
//  CircleView.swift
//  LoadingAnimations
//
//  Created by Liu Chuan on 2020/10/25.
//

import SwiftUI

struct CircleView: View {
    
    /// 是否动画
    @Binding var isAnimationState: Bool
    
    /// 圆圈视图个数
    var circleViewCount: Int
    
    var body: some View {
        
        HStack {
            ForEach(0 ..< circleViewCount) { index in
                Circle()
                    .fill(Color.green)
                    .frame(width: 20, height: 20)
                    .scaleEffect(isAnimationState ? 1.0 : 0.5)
                    .animation(Animation.easeInOut(duration: 0.5)
                                .repeatForever()
                                .delay(Double(index) * 0.2))
            }
        }
    }
}

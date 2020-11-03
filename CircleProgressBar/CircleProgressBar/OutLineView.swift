//
//  OutLineView.swift
//  CircleProgressBar
//
//  Created by Liu Chuan on 2020/11/2.
//

import SwiftUI

/// 轮廓视图
struct OutLineView: View {
    
    /// 百分比
    @Binding var percentage: CGFloat
    
    /// 颜色
    var colors: [Color] = [Color.outlineStrokeColor]
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.clear)
                .frame(width: 250, height: 250)
                .overlay(
                    Circle()
                        //.trim(from: 0, to: percentage * 0.01)
                        .trim(from: 0, to: percentage)
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .fill(AngularGradient(gradient: .init(colors: colors),
                                              center: .center, startAngle: .zero,
                                              endAngle: .init(degrees: 360)))
                        // -90，向左旋转90度
                        .rotationEffect(.init(radians: -.pi / 2))
                ).animation(.spring(response: 1.0, dampingFraction: 1.0, blendDuration: 1.0))
        }
    }
}

//
//  ProgressBar.swift
//  Countdown
//
//  Created by Liu Chuan on 2019/5/12.
//  Copyright © 2019 Liu Chuan. All rights reserved.
//

import SwiftUI

/// 进度条视图
struct ProgressBar: View {
    /// 计时器
    var counter: Int
    /// 总倒计时
    var totalCountdown: CGFloat
    
    // fill gradient
    let gradient = AngularGradient(
        gradient: Gradient(colors: [.yellow, .orange]),
        center: UnitPoint(x: 0.5, y: 0.5),
        angle: Angle(degrees: 360)
    )
    
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Circle()
                    .trim(from: 0, to: startProgress())
                    .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin:.round))
                    .rotationEffect(.init(degrees: -90))    // 旋转-90度
//                    .fill(self.gradient).animation(.easeInOut(duration: 0.2))
                    .foregroundColor(   // 完成为绿色，否为橙色
                        (completed() ? Color.green : Color.orange)
                ).animation(
                    .easeInOut(duration: 0.2)
                )
        )
    }
    
    /// 完成
    func completed() -> Bool {
        return startProgress() == 1
    }
    
    /// 开始进度
    func startProgress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(totalCountdown))
    }
}

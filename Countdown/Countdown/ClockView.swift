//
//  ClockView.swift
//  Countdown
//
//  Created by Liu Chuan on 2019/5/12.
//  Copyright © 2019 Liu Chuan. All rights reserved.
//

import SwiftUI

/// 时钟视图
struct ClockView: View {
    /// 计数器
    var counter: Int
    /// 总倒计时
    var totalCountdown: CGFloat
    
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.custom("Avenir Next", size: 50))
                .fontWeight(.black)
        }
    }
    
    /// 目的: 根据 秒数 转换为格式化后的 字符串（分钟）
    ///
    /// - Returns: 格式化后的字符串
    func counterToMinutes() -> String {
        let currentTime = Int(totalCountdown) - counter
        print("总时长：\(totalCountdown)")
        print("计时器：\(counter)")
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
}

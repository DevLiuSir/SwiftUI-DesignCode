//
//  HourTexts.swift
//  Clock
//
//  Created by Liu Chuan on 2020/11/03.
//

import SwiftUI

/// 时钟小时文字
struct HourTexts: View {
    
    /// 索引
    @State var index: Int = 0
    
    /// 边缘比例
    let marginRatio: CGFloat
    
    var body: some View {
        
        // 处理12数字
        Text(index / 5 == 0 ? "12" : "\(index / 5)")
            .modifier(PositionInCircle(
                angle: .degrees(Double(index) * 6), marginRatio: marginRatio
            ))
    }
}

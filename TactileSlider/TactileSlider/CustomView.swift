//
//  CustomView.swift
//  TactileSlider
//
//  Created by Liu Chuan on 2020/5/13.
//  Copyright © 2020 Liu Chuan. All rights reserved.
//

import SwiftUI

struct CustomView: View {
    
    /// 百分比
    @Binding var percentage: Float // 绑定了某些值
    
    var body: some View {
        GeometryReader { geometry in
            // TODO：-可能需要水平和垂直对齐
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray)
                Rectangle()
                    .foregroundColor(.accentColor)
                    .frame(width: geometry.size.width * CGFloat(self.percentage / 100))
            }
            .cornerRadius(12)
            .gesture(DragGesture(minimumDistance: 0)
            .onChanged({ value in
                // TODO：-也许在这里使用其他逻辑
                self.percentage = min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)
            }))
        }
    }
}

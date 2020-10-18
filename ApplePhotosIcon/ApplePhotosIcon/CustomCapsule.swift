//
//  CustomCapsule.swift
//  ApplePhotosIcon
//
//  Created by Liu Chuan on 2020/10/19.
//

import SwiftUI


/// 自定义胶囊形状视图（花瓣由8个胶囊形状组成）
struct CustomCapsule: View {
    
    /// 颜色
    var color: Color
    /// 角度
    var degree: Double
    
    var body: some View {
        
        Capsule()   // 胶囊形状
            .foregroundColor(color)
            .frame(width: 50, height: 70)
            .offset(x: 0, y: 38)
            .rotationEffect(.degrees(degree))  //根据自定义的degree属性旋转
            .opacity(0.6)  // 设置不透明度，可以看到图形下方的颜色
    }
}



//
//  ButtonView.swift
//  AppleRemote
//
//  Created by Liu Chuan on 2020/12/1.
//

import SwiftUI

/// 按钮视图
struct ButtonView: View {
    /// 按钮图标
    var icon: String
    /// 按钮颜色
    @State var color: Color = Color.gray
    /// 是否需要边框
    @State var isNeedBorder: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundColor(.white)
        }
        .frame(width: 60, height: 60)
        .background(color)
        .cornerRadius(30)
        //给按钮添加 边框 与 圆角
        .overlay(isNeedBorder ? RoundedRectangle(cornerRadius: 30, style: .circular)
                    .stroke(Color.secondary.opacity(0.3), lineWidth: 1) : nil)
    }
}

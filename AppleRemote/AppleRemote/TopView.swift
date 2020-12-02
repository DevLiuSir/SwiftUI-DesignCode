//
//  TopView.swift
//  AppleRemote
//
//  Created by Liu Chuan on 2020/12/1.
//

import SwiftUI

/// 顶部视图
struct TopView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color.gray.opacity(0.1))
            .frame(height: 300)
            .overlay(MenuAndTVButton())
    }
}

/// MENU、TV按钮
struct MenuAndTVButton: View {
    
    private let menuWidth: CGFloat = 60
    private let lineW: CGFloat = 2
    
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 20, height: 5)
                .foregroundColor(Color.secondary.opacity(0.6))
                .offset(x: 0, y: -80)
            HStack(spacing: 20) {
                Button(action: {
                    print("按下了MENU.")
                }, label: {
                    Text("MENU")
                        .font(.system(size: 12))
                        .frame(width: menuWidth - lineW, height: menuWidth - lineW)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(menuWidth / 2)
                })
                //给按钮添加 边框 与 圆角
                .overlay(
                    RoundedRectangle(cornerRadius: 30, style: .circular)
                        .stroke(Color.white, lineWidth: lineW)
                )
                
                Button(action: {
                    print("按下了TV.")
                }, label: {
                    ButtonView(icon: "tv",color: .black, isNeedBorder: true)
                })
            }.offset(y: 100)
        }
    }
}

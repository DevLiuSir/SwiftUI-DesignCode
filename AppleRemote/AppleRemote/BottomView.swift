//
//  BottomView.swift
//  AppleRemote
//
//  Created by Liu Chuan on 2020/12/1.
//

import SwiftUI

/// 底部视图
struct BottomView: View {
    
    var body: some View {
        
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                Button(action: {
                    print("按下了mic.")
                }, label: {
                    ButtonView(icon: "mic.fill", color: Color.secondary.opacity(0.4), isNeedBorder: true)
                        .font(.title3)
                })
                
                Button(action: {
                    print("按下了playpause.")
                }, label: {
                    ButtonView(icon: "playpause.fill", color: Color.secondary.opacity(0.4), isNeedBorder: true)
                        .font(.subheadline)
                })
            }
            VStack(alignment: .leading, spacing: 10) {
                RoundedRectangle(cornerRadius: 30.0)
                    .foregroundColor(Color.secondary.opacity(0.4))
                    .frame(width: 60, height: 140)
                    .overlay(
                        VStack(spacing: 20) {
                            Button(action: {
                                print("按下了plus.")
                            }, label: {
                                ButtonView(icon: "plus", color: .clear, isNeedBorder: false)
                            })
                            
                            Button(action: {
                                print("按下了minus.")
                            }, label: {
                                ButtonView(icon: "minus", color: .clear, isNeedBorder: false)
                            })
                        }
                    )
                    
                    //给按钮添加 边框 与 圆角
                    .overlay(
                        RoundedRectangle(cornerRadius: 30, style: .circular)
                            .stroke(Color.secondary.opacity(0.3), lineWidth: 1)
                    )
            }
        }
        .padding(.top, 5)
    }
}

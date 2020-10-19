//
//  PasswordButton.swift
//  AppLock
//
//  Created by Liu Chuan on 2020/10/19.
//

import SwiftUI

/// 密码按钮
struct PasswordButton : View {
    
    var value : String
    @Binding var password : String
    @Binding var key : String
    @Binding var unlocked : Bool
    @Binding var wrongPass : Bool
    
    
    var body: some View{
        
        Button(action: setPassword, label: {
            VStack {
                if value.count > 6 {
                    // Image...
                    Image(systemName: "delete.left")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }else if value == "Cancel" {
                    Text(value)
                        .font(.system(size: 15))
                        .font(.title)
                        .foregroundColor(.white)
                }else {
                    Text(value)
                        .font(.system(size: 30))
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()
        })
        .frame(width: 80, height: 80)
        //给view添加边框与圆角
        .overlay(
            RoundedRectangle(cornerRadius: 40, style: .circular)
                 .stroke(Color.gray, lineWidth: 1)
        )
    }
}



extension PasswordButton {
    
    /// 设置密码
    private func setPassword() {
        
        // 检查是否按了退格键...
        withAnimation {
            if value.count > 1 {
                if password.count != 0 {
                    password.removeLast()   //删除并返回集合的最后一个元素
                }
            }else {
                isTyping()
            }
        }
    }
    
    /// 正在输入
    private func isTyping() {
        if password.count != 4 {
            password.append(value)
            // Delay Animation...
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation {
                    if password.count == 4 {
                        if password == key {
                            unlocked = true
                        } else {
                            wrongPass = true
                            password.removeAll()
                        }
                    }
                }
            }
        }
    }
}

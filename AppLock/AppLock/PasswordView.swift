//
//  PasswordView.swift
//  AppLock
//
//  Created by Liu Chuan on 2020/10/19.
//

import SwiftUI


/// 密码视图（小圆）
struct PasswordView : View {
    
    var index : Int
    /// 密码
    @Binding var password : String
    
    var body: some View{
        ZStack{
            Circle()
                .stroke(Color.white,lineWidth: 2)
                .frame(width: 20, height: 20)
            // 检查是否正在输入...
            if password.count > index {
                Circle()    // 填充白色圆
                    .fill(Color.white)
                    .frame(width: 20, height: 20)
            }
        }
    }
}

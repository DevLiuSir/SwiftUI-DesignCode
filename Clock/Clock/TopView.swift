//
//  TopView.swift
//  Clock
//
//  Created by Liu Chuan on 2020/11/03.
//

import SwiftUI

/// 顶部视图
struct TopView: View {
    
    /// 是否为暗黑模式
    @Binding var isDark: Bool
    
    
    var body: some View {
        HStack {
            Text("Beautiful Clock")
                .font(.title)
                .fontWeight(.heavy)
            
            Spacer(minLength: 0)
            
            // 切换模式按钮
            Button(action: {
                isDark.toggle() // 切换浅、深模式
            }) {
                Image(systemName: isDark ? "sun.min.fill" : "moon.fill")
                    .font(.system(size: 22))
                    .foregroundColor(isDark ? .black : .white)
                    .padding()
                    .background(Color.primary)
                    .clipShape(Circle())
            }
        }
        .padding()
    }
}

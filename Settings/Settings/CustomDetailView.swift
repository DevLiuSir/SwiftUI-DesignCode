//
//  CustomDetailView.swift
//  Settings
//
//  Created by Liu Chuan on 2020/10/21.
//  Copyright © 2020 Liu Chuan. All rights reserved.
//

import SwiftUI

/// 自定义详情页
struct CustomDetailView: View {
    
    /// 信息
    let message: String
    
    var body: some View {
        // 文本显示字符串属性的值
        Text(message)
            .navigationBarTitle(Text("Custom Detail View"), displayMode: .inline)
    }
    
}

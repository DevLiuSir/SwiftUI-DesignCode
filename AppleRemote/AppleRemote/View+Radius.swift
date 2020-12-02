//
//  View+Radius.swift
//  AppleRemote
//
//  Created by Liu Chuan on 2020/12/1.
//

import SwiftUI

// 扩展视图增加cornerRadius修饰符
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

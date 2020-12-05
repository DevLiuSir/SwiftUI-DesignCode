//
//  Color+Extension.swift
//  SlideOutMenu
//
//  Created by Liu Chuan on 2020/12/05.
//

import SwiftUI

// MARK: - UIColor Extension
extension Color {
    // rgb
    static func rgb(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
    
    /// 图片背景色
    static let imageColor = Color.rgb(r: 95, g: 99, b: 120)
}

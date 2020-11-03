//
//  Color+Extension.swift
//  CircleProgressBar
//
//  Created by Liu Chuan on 2020/11/2.
//

import SwiftUI

// MARK: - UIColor Extension
extension Color {
    // rgb
    static func rgb(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
    /// 背景色
    static let backgroundColor = Color.rgb(r: 21, g: 22, b: 33)
    /// 轮廓颜色
    static let outlineStrokeColor = Color.rgb(r: 234, g: 46, b: 111)
    /// 跟踪图层颜色
    static let trackStrokeColor = Color.rgb(r: 56, g: 25, b: 49)
    /// 脉动图层颜色
    static let pulsatingFillColor = Color.rgb(r: 86, g: 30, b: 63)
}

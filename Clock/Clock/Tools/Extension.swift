//
//  Extension.swift
//  Clock
//
//  Created by Liu Chuan on 2020/11/03.
//

import SwiftUI

extension CGPoint {
    
    /// 计算在圆中的位置
    /// - Parameters:
    ///   - circle: 圆的尺寸
    ///   - angle: 角度
    ///   - margin: 边缘间距
    /// - Returns: CGPoint
    static func inCircle(_ circle: CGRect, for angle: Angle, margin: CGFloat = 0.0) -> Self {
        let radians = CGFloat(angle.radians) - .pi/2
        return CGPoint(
            x: circle.midX + (circle.radius - margin) * cos(radians),
            y: circle.midY + (circle.radius - margin) * sin(radians)
        )
    }
}

extension CGRect {
    
    /// 根据中心点、圆角，计算圆的尺寸位置
    /// - Parameters:
    ///   - center: 中心
    ///   - radius: 圆角
    /// - Returns: 圆的尺寸
    static func circle(center: CGPoint, radius: CGFloat) -> Self {
        .init(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)
    }
    
    ///中心
    var center: CGPoint { .init(x: midX, y: midY) }
    
    /// 圆角
    var radius: CGFloat { min(width, height)/2 }
}

extension GeometryProxy {
    /// 圆角
    var radius: CGFloat { min(size.width, size.height) / 2 }
    
    /// 圆
    var circle: CGRect { frame(in: .local) }
}

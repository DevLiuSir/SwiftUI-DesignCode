//
//  PositionInCircle.swift
//  Clock
//
//  Created by Liu Chuan on 2020/11/03.
//

import SwiftUI

/// 圆圈内的位置（视图的修改器）
struct PositionInCircle: ViewModifier {
    /// 角度
    let angle: Angle
    /// 比例
    let marginRatio: CGFloat

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content.position(.inCircle(geometry.circle, for: self.angle,
                margin: geometry.radius * self.marginRatio
            ))
        }
    }
}

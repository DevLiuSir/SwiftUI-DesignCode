//
//  TrackView.swift
//  CircleProgressBar
//
//  Created by Liu Chuan on 2020/11/2.
//

import SwiftUI

/// 跟踪图层视图
struct TrackView: View {
    var colors: [Color] = [Color.trackStrokeColor]
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.backgroundColor)
                .frame(width: 250, height: 250)
                .overlay(
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 20))
                        .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
                )
        }
    }
}

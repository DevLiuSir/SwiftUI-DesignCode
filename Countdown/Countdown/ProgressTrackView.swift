//
//  ProgressTrackView.swift
//  Countdown
//
//  Created by Liu Chuan on 2019/5/12.
//  Copyright © 2019 Liu Chuan. All rights reserved.
//

import SwiftUI

/// 进度追踪图层视图
struct ProgressTrackView: View {
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(Circle().stroke(Color.black.opacity(0.09), lineWidth: 15))
    }
}

//
//  PercentageLabel.swift
//  CircleProgressBar
//
//  Created by Liu Chuan on 2020/11/2.
//

import SwiftUI

/// 百分比标签
struct PercentageLabel: View {
    
    /// 百分比
    @Binding var percentage: CGFloat
    
    /// 是否在下载
    @Binding var isDownload: Bool
    
    var body: some View {
        ZStack {
            Text(isDownload ? "\(Int(percentage * 100)) %" : "Start")
                .font(.system(size: 32, weight: .bold))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
        .onTapGesture {
            self.isDownload.toggle()
            self.startLoading()
        }
    }
}

extension PercentageLabel {
    
    func startLoading() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation() {
                self.percentage += 0.01
                if self.percentage >= 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
}

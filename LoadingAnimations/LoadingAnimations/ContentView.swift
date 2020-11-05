//
//  ContentView.swift
//  LoadingAnimations
//
//  Created by Liu Chuan on 2020/10/25.
//

import SwiftUI

struct ContentView: View {
    
    /// 是否动画
    @State private var isAnimate = false
    
    var body: some View {
      
        VStack(spacing: 60) {
            CircleView(isAnimationState: $isAnimate, circleViewCount: 4)
            AccordionView(isAnimationState: $isAnimate)
            AudioEqualizer(isAnimationState: $isAnimate)
            ActivityIndicator(isAnimationState: $isAnimate, indicatorCount: 6, spacing: 10)
            RotatingDotsIndicatorView()
                .foregroundColor(.green)
                .frame(width: 100, height: 100, alignment: .center)
            HorizontalBarView(isAnimationState: $isAnimate)
            SeismicWaveView(isAnimationState: $isAnimate)
        }
        .onAppear() {
            self.isAnimate.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

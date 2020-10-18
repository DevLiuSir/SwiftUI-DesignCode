//
//  VoiceRecordingView.swift
//  VoiceRecordingAnimation
//
//  Created by Liu Chuan on 2019/10/18.
//

import SwiftUI

/// 录音视图
struct VoiceRecordingView: View {
    
    @State private var animateSmallCircle = false
    @State private var animateBigCircle = false
    
    var body: some View {
        
        VStack {
            Text("Hello, do you need any help?")
                .font(.title)
                .foregroundColor(.gray)
                .fontWeight(.heavy) // 设置文字加粗
            ZStack {
                
                Circle()  // Circle pulse
                    .stroke()
                    .frame(width: 340, height: 340)
                    .foregroundColor(.gray)
                    .scaleEffect(animateBigCircle ? 1 : 0.3)
                    .opacity(animateBigCircle ? 0 : 1)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
                    .onAppear(){
                        self.animateBigCircle.toggle()
                    }
                Circle()  // Circle pulse
                    .stroke()
                    .frame(width: 340, height: 340)
                    .foregroundColor(.gray)
                    // 缩放
                    .scaleEffect(animateBigCircle ? 1 : 0.3)
                    // 透明度
                    .opacity(animateBigCircle ? 0 : 1)
                    .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: false))

                Circle()  // Circle pulse
                    .stroke()
                    .frame(width: 340, height: 340)
                    .foregroundColor(.gray)
                    // 缩放
                    .scaleEffect(animateBigCircle ? 1 : 0.3)
                    // 透明度
                    .opacity(animateBigCircle ? 0 : 1)
                    .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: false))
                
                Circle() // Gray
                    .foregroundColor(Color(red: 0.905, green: 0.91, blue: 0.91))
                    .frame(width: 150, height: 150)
                    .scaleEffect(animateSmallCircle ? 0.5 : 1.1)
                    .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.animateSmallCircle.toggle()
                    }
                
                Image(systemName: "mic.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80).foregroundColor(.red)
                
                Text("Siri")
                    .font(.title)
                    .foregroundColor(.gray)
                    .offset(y: 80)
                
            }.offset(y: 300)
        }
    }
}

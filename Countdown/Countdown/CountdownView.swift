//
//  CountdownView.swift
//  Countdown
//
//  Created by Liu Chuan on 2019/5/12.
//  Copyright © 2019 Liu Chuan. All rights reserved.
//

import SwiftUI


struct CountdownView: View {
    /// 是否开始
    @State var start = false
    
    /// 计时器
    @State var counter: Int = 0
    
    /// 倒计时（默认：以秒为单位）
    @State var countDown: CGFloat = 10
    
    /// 返回以给定间隔重复发出当前日期的发布者
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    

    var body: some View {
       
        VStack {
            ZStack {
                ProgressTrackView()
                ProgressBar(counter: counter, totalCountdown: countDown)
                ClockView(counter: counter, totalCountdown: countDown)
            }

            HStack(spacing: 20){
                // Play button
                Button(action: {
                    self.start.toggle()
                    print("是否播放：\(self.start)")
                }) {
                    HStack(spacing: 15){
                        Image(systemName: self.start ? "pause.fill" : "play.fill")
                            .foregroundColor(.white)
                        Text(self.start ? "Pause" : "Play")
                            .foregroundColor(.white)
                    }
                    .padding(.vertical)
                    .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                    .background(Color.orange)
                    .clipShape(Capsule())
                    .shadow(radius: 6)
                }
                
                // Restart button
                Button(action: {
                    print("重置。。。。")
                    self.counter = 0
                    withAnimation(.default){
                        self.countDown = self.countDown
                    }
                }) {
                    HStack(spacing: 15){
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.orange)
                        Text("Restart")
                            .foregroundColor(.orange)
                    }
                    .padding(.vertical)
                    .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                    .background(Capsule().stroke(Color.orange, lineWidth: 2))
                    .shadow(radius: 6)
                }
            }
            .padding(.top, 55)  // 按钮顶部间距
        }
        
        .onReceive(timer) { time in
            self.startCounting()
        }
    }
    
    
    /// 开始计时
    func startCounting() {
        if self.start {
            if (self.counter < Int(self.countDown)) {
                self.counter += 1
            }else {
                self.start.toggle()
            }
        }
    }
    
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}

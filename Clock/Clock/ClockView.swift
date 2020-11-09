//
//  ClockView.swift
//  Clock
//
//  Created by Liu Chuan on 2020/11/03.
//

import SwiftUI

/// 时钟视图
struct ClockView: View {
    
    /// 是否为暗黑模式
    @Binding var isDark : Bool
    
    /// 当前时间
    @State var currentTime = Time(sec: 0, min: 0, hour: 0)
    
    /// 接受者
    @State var receiver = Timer.publish(every: 1, on: .current, in: .default).autoconnect()
    
    /// 秒针的颜色（默认：Color.primary）
    @State var secondColor: Color = Color.primary
    
    /// 表盘主题颜色
    @State var dialThemeColor: Color = Color("Color")
    
    /// 是否为 12小时制
    @State var is12HourClock: Bool = false
    
    
    var body: some View {
        VStack {
            TopView(isDark: $isDark)
            
            Spacer(minLength: 0)
    
            ClockDialView(currentTime: $currentTime, isDark: $isDark, secondColor: secondColor, dialColor: dialThemeColor)
                .frame(width: screenW, height: screenW)
            
            TimeZoneView(is12h: $is12HourClock)
            
            Spacer(minLength: 0)
        }
        .onAppear(perform: {
            let calender = Calendar.current
            let min = calender.component(.minute, from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour, from: Date())
            
            withAnimation(Animation.linear(duration: 0.01)) {
                self.currentTime = Time(sec: sec, min: min, hour: hour)
            }
        })
        .onReceive(receiver) { (_) in
            /// 创建日历对象
            let calender = Calendar.current
            // component: 返回日期的组成部分的值
            let min = calender.component(.minute, from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour, from: Date())
            
            withAnimation(Animation.linear(duration: 0.01)) {
                self.currentTime = Time(sec: sec, min: min, hour: hour)
            }
        }
    }
}

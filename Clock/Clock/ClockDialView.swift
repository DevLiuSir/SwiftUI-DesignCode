//
//  ClockDialView.swift
//  Clock
//
//  Created by Liu Chuan on 2020/11/03.
//

import SwiftUI


/// 时钟表盘视图
struct ClockDialView: View {
    
    /*
     90度:15分钟，5分钟= 90/3，1分钟= 90/3/5 = 6°
     */
    
    /// 当前时间
    @Binding var currentTime: Time
    
    /// 是否为暗黑模式
    @Binding var isDark: Bool
    
    /// 秒针的颜色（默认：Color.primary）
    @State var secondColor: Color = Color.red
    
    /// 表盘颜色（默认为白色）
    @State var dialColor: Color = Color("Color")
    
    /// 秒针的高度
    private let secHeight: CGFloat = screenW / 2 - 20
    
    
    var body: some View {
        
        ZStack {
            Circle()
                .fill(dialColor)
                .frame(width: screenW - 50, height: screenW - 50)
            
            Text("ROLEX")
                .foregroundColor(Color.primary)
                .font(.system(size: 25))
                .offset(x: 0, y: -90)
            
            // 工作日
            Text("\(getWeekdayWithNumber()) \(getday())")
                .fontWeight(.bold)
                .background(isDark ? Color.white : Color.black)
                .foregroundColor(isDark ? Color.black : Color.white)
                .offset(x: 70)
            
            // 表盘上的刻度
            ForEach(0 ..< 60, id: \.self) { i in
                Rectangle()
                    .fill(Color.primary)
                    // 每小时：60 / 12 = 5
                    // (i % 5) == 0 : 小时刻度
                    .frame(width: (i % 5) == 0 ? 15 : 5, height: (i % 5) == 0 ? 15 : 5)
                    .cornerRadius(i % 5 == 0 ? 15 / 2 : 0)
                    .offset(y: (screenW - 110) / 2)
                    .rotationEffect(.init(degrees: Double(i) * 6))
                
                // 数字
                if i % 5 == 0 {
                    HourTexts(index: i, marginRatio: 3 / 8)
                }
            }

            // Hour
            Rectangle()
                .fill(Color.primary)
                .frame(width: 6.5, height: secHeight / 3)
                .offset(y: -secHeight / 3 / 2)
                .rotationEffect(.init(degrees: (Double(currentTime.hour) + (Double(currentTime.min) / 60)) * 30))

            // Min
            Rectangle()
                .fill(Color.primary)
                .frame(width: 6, height: secHeight / 2)
                .offset(y: -secHeight / 2 / 2)
                .rotationEffect(.init(degrees: Double(currentTime.min) * 6))
            
            // Sec
            Rectangle()
                .fill(secondColor)
                .frame(width: 2, height: secHeight)
                .offset(x: 0, y: -50)
                
                // 秒针上的2个圆
                .overlay(
                    Circle()
                        .foregroundColor(secondColor)
                        .frame(width: 12, height: 12)
                        .offset(x: 0, y: -100)
                )
                .overlay(
                    Circle()
                        .foregroundColor(secondColor)
                        .frame(width: 10, height: 10)
                        .offset(x: 0, y: secHeight / 2 - 50)
                )
                // 旋转1分钟的6度
                .rotationEffect(.init(degrees: Double(currentTime.sec) * 6))

            // 中心圆
            Circle()
                .fill(Color.primary)
                .frame(width: 15, height: 15)
        }
    }
}

// MARK: - Get date method
extension ClockDialView {
    
    /// 根据数字获取工作日
    /// - Parameter number: 数字
    func getWeekdayWithNumber() -> String {
        
        /*
         星期一，Mon.（全称Monday）
         星期二，Tues.（全称Tuesday）
         星期三，Wed.（全称Wednesday）
         星期四，Thur.（全称Thursday）
         星期五，Fri.（全称Friday）
         星期六，Sat.（全程Saturday）
         星期日 Sun.（全称Sunday)
         */
        
        /// 创建日历对象
        var calender = Calendar.current
        //默认情况下，日历未设置语言环境。
        //如果您希望收到本地化的答案，请务必首先将locale属性设置为。Locale.autoupdatingCurrent
        calender.locale = Locale.autoupdatingCurrent
        
        /// 返回日期的周
        let number = calender.component(.weekday, from: Date())
        // 使用本地化字符串
        switch number {
        case 1:
            return NSLocalizedString("Sun", comment: "")
        case 2:
            return NSLocalizedString("Mon", comment: "")
        case 3:
            return NSLocalizedString("Tues", comment: "")
        case 4:
            return NSLocalizedString("Wed", comment: "")
        case 5:
            return NSLocalizedString("Thur", comment: "")
        case 6:
            return NSLocalizedString("Fri", comment: "")
        case 7:
            return NSLocalizedString("Sat", comment: "")
        default:
            return ""
        }
    }
    
    /// 获取当前几日
    func getday() -> String {
        /// 创建日历对象
        var calender = Calendar.current
        //默认情况下，日历未设置语言环境。
        //如果您希望收到本地化的答案，请务必首先将locale属性设置为。Locale.autoupdatingCurrent
        calender.locale = Locale.autoupdatingCurrent
        // 获取多少号
        let day = calender.component(.day, from: Date())
        return "\(day)"
    }
    
}


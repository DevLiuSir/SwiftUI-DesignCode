//
//  TimeZoneView.swift
//  Clock
//
//  Created by Liu Chuan on 2020/11/03.
//

import SwiftUI

/// 时区视图
struct TimeZoneView: View {
    
    @Binding var is12h: Bool
    
    var body: some View  {
    
        VStack {
            /*
             Locale.current.languageCode: 获取当前语言环境的语言代码。(en)
             Locale.current.regionCode:   获取当前区域，语言环境的区域代码。(US)
             Locale.current.identifier:   语言环境的标识符。(en_US)
             Locale.current.localizedString(forIdentifier: "zh"): 指定语言环境标识符的本地化字符串 (Chinese)
             Locale.current.localizedString(forRegionCode: "cn"): 指定区域代码的本地化字符串。(China mainland)
            */
            // 获取区域设置区域名称。regionCode: 语言环境的区域代码
            //Text(Locale.current.localizedString(forRegionCode: Locale.current.regionCode!) ?? "")
            Text(Locale.current.localizedString(forRegionCode: "cn") ?? "")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 35)
            
            Text(getTime())
                .font(.system(size: 45))
                .fontWeight(.heavy)
                .padding(.top,10)
        }
    }
}


// MARK: - Get date method
extension TimeZoneView {
    
    /// 获取时间
    /// - Returns: 特定格式的时间
    func getTime() -> String {
        let df = DateFormatter()
        
        //df.locale = Locale(identifier: "zh-CN")
        
        // 跟踪用户当前偏好的语言环境。自动更新的语言环境
        df.locale = Locale.autoupdatingCurrent
        
        if is12h {
            // 设置时间格式
            // “a”是AM / PM指示符的ICU符号。
            // 它永远不可能是“ A”，因为ICU使用“ A”来表示完全不同的东西（一天中的毫秒数）。
            df.dateFormat = "hh:mm a"
            print("----- 12小时制 -------")
        }else {
            df.dateFormat = "HH:mm"
            print("----- 24小时制 -------")
        }
        
        // 设置时区
        //df.timeZone = TimeZone(identifier: "Asia/Shanghai")
        //系统当前使用的时区。
        df.timeZone = TimeZone.current
        
        // 调用string方法进行转换
        return df.string(from: Date())
    }
    
}

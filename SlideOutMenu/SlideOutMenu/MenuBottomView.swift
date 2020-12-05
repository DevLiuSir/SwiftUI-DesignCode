//
//  MenuBottomView.swift
//  SlideOutMenu
//
//  Created by Liu Chuan on 2020/12/05.
//

import SwiftUI

struct MenuBottomView: View {
    @Binding var wdith: CGFloat
    @Binding var isDark: Bool
    
    var body: some View {
        
        ZStack {
            HStack(spacing: 30) {
                VStack {
                    Image("sidebar_setting")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                    Text("设置")
                        .font(.system(size: 15))
                        .foregroundColor(self.isDark ? Color.white : Color.black)
                }
                
                Button(action: {
                    self.isDark.toggle()
                    
                    // 修改窗口的根视图, 用户界面样式.
                    UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.isDark ? .dark : .light
                }) {
                    VStack {
                        Image(systemName: isDark ? "sun.min.fill" : "moon.fill")
                            //Image("sidebar_nightmode_off")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.imageColor)
                        
                        Text("夜间")
                            .font(.system(size: 15))
                            .foregroundColor(self.isDark ? Color.white : Color.black)
                    }
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "cloud.sun.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.imageColor)
                        
                        Text("29°")
                            .font(.system(size: 15))
                            .foregroundColor(self.isDark ? Color.white : Color.imageColor)
                    }
                    
                    Text("香港")
                        .font(.system(size: 15))
                        .foregroundColor(self.isDark ? Color.white : Color.black)
                }
            }
        }
        .padding(.leading, -130)
        .padding(.top, -40)
        .frame(width: self.wdith, height: 120)
        .background(self.isDark ? Color.black : Color.white)
    }
}

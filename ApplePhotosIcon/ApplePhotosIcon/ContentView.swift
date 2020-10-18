//
//  ContentView.swift
//  ApplePhotosIcon
//
//  Created by Liu Chuan on 2019/10/19.
//

import SwiftUI

struct ContentView: View {
    
    /// 是否旋转
    @State private var  shouldRotate: Bool = false
    /// 是否缩放
    @State private var  shouldScale: Bool = false
    
    var body: some View {
        
        ZStack {
            FlowerView()
                .rotationEffect(.degrees(shouldRotate ? 0 : 360), anchor: .center)
                
                // 渐入渐出的动画效果、5秒、无限循环
                .animation(Animation.easeInOut(duration: 5).repeatForever().speed(3))
                //.animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: false).speed(3))
                
                .onTapGesture(perform: {            // 花朵视图添加点击手势
                    self.shouldRotate.toggle()      // 点击示切换bool属性值
                })
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

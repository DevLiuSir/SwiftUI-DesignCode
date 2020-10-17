//
//  HomeView.swift
//  LockScreenBatteryMagSafe
//
//  Created by Liu Chuan on 2019/10/18.
//  Copyright © 2019 Liu Chuan. All rights reserved.
//


import SwiftUI


/// Home视图
struct HomeView: View {
    
    /// 大小
    @State private var size = UIScreen.main.bounds.width - 100
    /// 进度
    @State private var progress : CGFloat = 0
    /// 角度
    @State private var angle : Double = 0
    /// 是否显示白色圆圈
    @State private var showWhiteCircleStroke = false
    
    var body: some View {
        
        VStack {
            ZStack {
                // 进度底色
                Circle()
                    .stroke(Color.init(UIColor.darkGray),style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
                    .frame(width: size, height: size)
                
                // 绿色进度
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.green,style: StrokeStyle(lineWidth: 25, lineCap: .round))
                    .frame(width: size, height: size)
                    .rotationEffect(.init(degrees: -90))
                    
                if showWhiteCircleStroke {
                    
                    // 绘制白色圆，并添加拖动手势
                    Circle()
                        .fill(Color.white)
                        .frame(width: 35, height: 35)
                        .offset(x: size / 2)
                        .rotationEffect(.init(degrees: angle))
                        // 添加手势...
                        .gesture(DragGesture().onChanged(onDrag(value:)))
                        .rotationEffect(.init(degrees: -90))
                }
                
                // 按钮
                Button(action: {
                    // 切换是否显示的值。默认为FALSE
                    self.showWhiteCircleStroke.toggle()
                }) {
                    Image(systemName: "bolt.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100).foregroundColor(.green)
                }.padding()
                
            }
            
            // progress -> %100
            Text(String(format: "%.0f", progress * 100) + "% Charged")
                .offset(x: 0, y: 30)
                .font(.largeTitle)
        }
    }
    
    /// 拖拽手势
    /// - Parameter value: 拖拽的数值
    private func onDrag(value: DragGesture.Value) {
        
        // 计算弧度
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        
        // 因为 atan2 将给出 -180 到 180
        // 消除拖动手势的大小
        // 白色圆形大小：35， 半径就为：35 / 2 = 17.5
        let radians = atan2(vector.dy - 17.5, vector.dx - 17.5)
        
        // 转换角度
        var angle = radians * 180 / .pi
        
        // 0 到 360
        // 例如= 360-170 = 190
        if angle < 0 {
            angle = 360 + angle
        }
        
        withAnimation(Animation.linear(duration: 0.15)){
            // 进度
            let progress = angle / 360
            self.progress = progress
            self.angle = Double(angle)
        }
    }
    
}

//
//  ContentView.swift
//  SpringIndicator
//
//  Created by Liu Chuan on 2020/11/1.
//

import SwiftUI

struct ContentView: View {
    
    /// 偏移量
    @State private var offsetY: CGFloat = 0
    
    /// 颜色数组
    private let colors : [Color] = [.red, .orange, .blue, .green, .yellow, .purple, .gray]
    
    /// 动画数组，包含7个动画元素
    private let animations: [Animation] =
        [Animation.interpolatingSpring(stiffness: 100, damping: 10),
         Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(0.1),
         Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(0.2),
         Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(0.3),
         Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(0.4),
         Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(0.5),
         Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(0.6)
        ]
    
    var body: some View {
        
        VStack {
            HStack {
                // 根据颜色数组的个数，循环创建不同颜色的圆形
                ForEach(0 ..< colors.count) { item in
                    Circle()
                        .fill(self.colors[item])
                        .frame(width: 40, height: 40)
                        .offset(x: 0, y: self.offsetY)
                        // 添加动画
                        .animation(self.animations[item])
                }
            }
            // 默认上移300
            .offset(x: 0, y: -300)

            // 按钮
            Button(action: {
                if offsetY <= 0 {    // 防止多次点击，改变offsetY的值。只能单击改变偏移量
                    self.offsetY += 200
                    // 延迟2秒，还原
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.offsetY -= 200
                    }
                }
            }, label: {
                Text("Start execute animations")
                    .foregroundColor(.white)
                    .frame(width: 220, height: 40)
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 5, x: -5, y: -3)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

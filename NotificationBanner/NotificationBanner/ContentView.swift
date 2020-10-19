//
//  ContentView.swift
//  NotificationBanner
//
//  Created by Liu Chuan on 2020/11/4.
//

import SwiftUI

struct ContentView: View {
    
    /// 是否显示
    @State var isShow = false
    
    /// 偏移量
    @State var offset: CGFloat = 0
    
    /// 是否单击
    @State private var isSingleTap = false
    
    
    /// 创建(阻尼、弹簧)弹簧动画
    let animation: Animation =
        /*
         interpolatingSpring（质量：刚度：阻尼：初始速度:)
         一种插值弹簧动画，它使用阻尼弹簧模型来生成[0，1]范围内的值，然后将其用于在动画属性的[from，to]范围内进行插值。通过添加每个动画的效果来保留重叠动画的速度。
         
         mass: 附着在弹簧上的物体的质量。
         stiffness:弹簧的刚度。
         damping: 弹簧阻尼值。
         initialVelocity: 弹簧的初始速度，为[0，1]范围内的值，代表要设置的值的大小。
         */
        Animation.interpolatingSpring(stiffness: 200, damping: 10)
    
    var body: some View {
        ZStack {
            NotificationBannerView()
                    .offset(x: 0, y: offset)
                    .animation(self.animation)
            
            Button(action: {
                if offset <= 0 {    // 防止多次点击，改变offset的值。只能单击改变偏移量
                    print("Pop Up Notification Banner。。。。")
                    offset += 300
                    // 延迟2秒，还原
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.offset -= 300
                    }
                }
            }, label: {
                Text("Pop Up Notification Banner")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50, alignment: .center)
                    .background(Color.purple)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 5, x: -2, y: -1)
                    .lineLimit(2)
                    //设置多行文本的对齐方式
                    .multilineTextAlignment(.center)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

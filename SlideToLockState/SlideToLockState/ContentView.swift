//
//  ContentView.swift
//  SlideToLockState
//
//  Created by Liu Chuan on 2020/10/22.
//

import SwiftUI


struct ContentView: View {
    
    /// 是否关机
    @State private var isShutDown = false
    /// 屏幕宽度
    private let screenW: CGFloat = UIScreen.main.bounds.width
    /// 屏幕高度
    private let screenH: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        
        VStack {
            ZStack {
                if isShutDown {
                    PowerView()
//                    Text("Successfully unlocked !")
//                        .font(.largeTitle)
//                        .foregroundColor(.black)
                }
                else {
                    LockScreen(state: .PowerOff)
                }
            }
            
            /*
             添加一个操作，以在此视图检测到给定发布者发出的数据时执行。
             - publisher: 发通知者
             - perform: 监听通知发出事件时， 要执行的操作
             */
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name("Success")), perform: { _ in
                // 这里表示，监听滑动完成，开始动画回到首页
                withAnimation {
                    self.isShutDown = true
                }
            })
        }
        .background(Color.black)
    }
}

    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

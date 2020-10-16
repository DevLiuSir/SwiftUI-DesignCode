//
//  DragView.swift
//  GestureHandle
//
//  Created by Liu Chuan on 2020/10/16.
//


import SwiftUI

let screenW: CGFloat = UIScreen.main.bounds.width
let screenH: CGFloat = UIScreen.main.bounds.height

struct DragView : View {
    
    /// 拖拽的偏移量
    @Binding var offset: CGSize
    
    var body: some View {
        VStack {
            HStack {
                Text("Drag Gesture View")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .lineLimit(nil)
                    //设置多行文本的对齐方式
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(width: screenW, height: screenH, alignment: .center)
        // 背景渐变
        .background(LinearGradient(gradient: Gradient(colors: [.purple, .green]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing))
        .cornerRadius(32)
        .shadow(radius: 20)
        .edgesIgnoringSafeArea(.all)
        .padding(.top, 150)
        
        // 修改偏移量
        .offset(y: offset.height < 0 ? 0 : offset.height)
        .animation(.spring()) // 添加弹性动画
        
        // 添加手势...
        .gesture(
            DragGesture()
                // 响应拖动时的状态 变化事件
                .onChanged(onDrag(_:))
                // 响应拖动时的状态 结束事件
                .onEnded(endDrag(_:))
        )
    }
}

// MARK: - 手势处理（ gesture handle ）
extension DragView {
    
    /// 拖拽手势
    /// - Parameter value: 拖拽的数值
    private func onDrag(_ value: DragGesture.Value) {
        // 偏移量为拖动的值
        self.offset = value.translation
    }
    
    /// 拖拽结束
    private func endDrag(_ value: DragGesture.Value) {
        // 如果偏移量为屏幕高度的1/4,设置其位置
        if self.offset.height > screenH / 4 {
            self.offset = CGSize(width: 0, height: screenH)
        } else {
            // 返回视图原来的位置
            self.offset = .zero
        }
    }
}

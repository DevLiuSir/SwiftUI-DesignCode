//
//  MainView.swift
//  SlideOutMenu
//
//  Created by Liu Chuan on 2020/12/05.
//

import SwiftUI

struct MainView: View {
    
    /// 左边菜单宽度
    @State var leftWidth = UIScreen.main.bounds.width - 80
    /// 偏移量
    @State var offsetX = -UIScreen.main.bounds.width + 80
    
    @State var isDark: Bool = false
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            
            HomePage(x: $offsetX, isDark: $isDark)
            
            SlideOutMenu(menuWidth: $leftWidth, isDark: $isDark, offsetX: $offsetX)
        }
        
        // 添加手势
        .gesture(DragGesture().onChanged(onChanged(_:)).onEnded(onEnd(_:)))
        .edgesIgnoringSafeArea(.top)
    }
}


// MARK: - Actions
extension MainView {
    
    /// 开始拖动修改
    /// - Parameter value: 拖动的值
    func onChanged(_ value: DragGesture.Value) {
        
        // 拖动时的 X 值
        let currentX = value.translation.width
        
        print("currentX: \(currentX)")
        
        withAnimation {
            if currentX > 0 {
                // 禁用拖动...
                if offsetX < 0 {
                    offsetX = -leftWidth + currentX
                }
            }
            else {
                if offsetX != -leftWidth {
                    offsetX = currentX
                }
            }
        }
    }
    
    /// 拖动结束
    /// - Parameter value: 拖动的值
    func onEnd(_ value: DragGesture.Value) {
        
        withAnimation {
            
            print("x: \(offsetX)")
            
            // 检查是否拖动了菜单值的一半意味着将x设置为0 ...
            if -offsetX < leftWidth / 2 {
                offsetX = 0
            }
            else {
                offsetX = -leftWidth
            }
        }
    }
}

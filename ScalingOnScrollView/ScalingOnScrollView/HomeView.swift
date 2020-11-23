//
//  HomeView.swift
//  ScalingOnScrollView
//
//  Created by Liu Chuan on 2020/11/12.
//

import SwiftUI

struct HomeView : View {
    
    var body: some View{
        VStack(spacing: 0) {
            HStack {
                Text("Zoom Animation")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white.shadow(color: Color.black.opacity(0.18), radius: 5, x: 0, y: 5))
            .zIndex(0)
            //在堆栈中移动视图以获得阴影效果.
            
            // 缩放效果
            GeometryReader { mainView in
                ScrollView{
                    VStack(spacing: 15){
                        ForEach(items,id: \.name) { thisItem in
                            // Item View
                            GeometryReader { item in
                                ItemView(item: thisItem)
                                    //从底部缩放效果
                                    .scaleEffect(scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY),anchor: .bottom)
                                    //添加不透明度效果...
                                    .opacity(Double(scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY)))
                            }
                            //设置每个卡片视图高度.
                            .frame(height: 100)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top,25)
                }
                //控制重叠视图的显示顺序
                .zIndex(1)
            }
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.top)
    }
    
}


extension HomeView {
    
    /// 计算 缩放效果 需要的数值
    /// - Parameters:
    ///   - mainFrame: 缩放视图的尺寸
    ///   - minY: 最小y值
    /// - Returns: 缩放倍数
    func scaleValue(mainFrame : CGFloat, minY : CGFloat)-> CGFloat {
        
        // 添加动画
        withAnimation(.easeOut) {
            
            // 降低顶部填充值
            let scale = (minY - 25) / mainFrame
            
            // 如果缩放值小于1，则将缩放值重新调整为“相册视图” ...
            if scale > 1 {
                return 1
            }
            else {
                return scale
            }
        }
    }
}

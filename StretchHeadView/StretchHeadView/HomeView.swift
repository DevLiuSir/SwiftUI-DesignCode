//
//  HomeView.swift
//  StretchHeadView
//
//  Created by Liu Chuan on 2020/12/2.
//

import SwiftUI

let screenW: CGFloat = UIScreen.main.bounds.width

struct HomeView: View {
    
    /// 定时器Timer，使用计时器重复触发事件（以给定间隔重复发出当前日期的发布者, 自动执行.）
    @State var time = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect()
    @State var showTopView = false
    
    private let pictureH: CGFloat = 300
    
    var body: some View {
        
        ZStack(alignment: .top, content: {
            
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 0) {
                    GeometryReader { geo in
                        /// y坐标的最小值
                        let minY: CGFloat = geo.frame(in: .global).minY
                        
                        Image("Girl")
                            .resizable()
                            .aspectRatio(contentMode: .fill)   // 保证图片比例不变 -> 放大， fit： 拉伸，不放大。
                            //.cornerRadius(50)
                            .offset(y: minY > 0 ? -minY : 0)
                            .frame(width: screenW ,height: minY > 0 ? pictureH + minY : pictureH)
                            
                            /*
                             添加一个操作，以在此视图检测到给定发布者发出的数据时执行。
                             - publisher: 发布者
                             - perform: 监听发出事件时， 要执行的操作
                             */
                            .onReceive(self.time, perform: { _ in
                                if -minY > pictureH {   // -minY值：上滑，看不见图片，就显示TopView
                                    withAnimation {
                                        self.showTopView = true
                                    }
                                }else {     // 隐藏
                                    withAnimation{
                                        self.showTopView = false
                                    }
                                }
                            })
                    }
                    .frame(height: pictureH)      // 图片默认尺寸
                    Spacer(minLength: 10)         // 间距
                    ListView(listCout: 50)
                }
            })
            if self.showTopView {
                TopView()
            }
        })
        .edgesIgnoringSafeArea(.top)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

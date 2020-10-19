//
//  NotificationBannerView.swift
//  NotificationBanner
//
//  Created by Liu Chuan on 2020/11/4.
//

import SwiftUI

struct NotificationBannerView: View {
    
    private let screenW: CGFloat = UIScreen.main.bounds.width
    private let screenH: CGFloat = UIScreen.main.bounds.height
    
//    @Binding var offset: CGSize
    
    var body: some View {
        
        ZStack {
            VStack {
               Text("Notification Banner")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                    
                Text("This type of banner floats and has the capability of growing to an infinite amount of lines. This one also has a shadow.")
                    .fontWeight(.black)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .lineLimit(4)
                    //设置多行文本的对齐方式
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(width: screenW - 50, height: 170, alignment: .center)
        // 背景渐变
        .background(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(20)
        .shadow(color: .green, radius: 10, x: 1, y: 1)
        // 默认处于屏幕之外
        .offset(x: 0, y: -600)
    }
}


struct NotificationBannerView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBannerView()
    }
}

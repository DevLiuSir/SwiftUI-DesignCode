//
//  MenuHeaderView.swift
//  SlideOutMenu
//
//  Created by Liu Chuan on 2020/12/05.
//

import SwiftUI

struct MenuHeaderView: View {
    
    @Binding var wdith: CGFloat
    
    @Binding var x: CGFloat
    
    var body: some View {
        
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image("UserAvatar")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        
                        Text("DevLiuSir")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    
                    HStack(spacing: 0) {
                        Image("hdr")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .clipShape(Circle())
                        Image("hdr")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .clipShape(Circle())
                        Image("hdr")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .clipShape(Circle())
                        
                        Image("hds")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .clipShape(Circle())
                        Image("hdt")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .clipShape(Circle())
                    }
                    
                    HStack {
                        Text("编辑个性签名")
                            .foregroundColor(.white)
                            .font(.system(size: 13))
                        Image("conversation_unsend_icon")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("There is no perfect system , only undiscovered vulnerabilities !")
                            .foregroundColor(.white)
                            .font(.system(size: 13))
                            .lineLimit(1)       // 行数
                    }
                }
                
                Image("group_qrcode_shadow")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
            }
            .padding()
        }
        .frame(width: self.wdith, height: 200)
        .background(Image("sidebar_bg")
                        .resizable())
        
        //.background(HeaderViewBackground(x: $x))
    }
}


// TODO: - 动画背景，需处理...
struct HeaderViewBackground: View {
    
    @State var isAnimate: Bool  = false
    
    @Binding var x: CGFloat
    
    
    var body: some View {
        
        ZStack {
            Image("sidebar_bg")
                .resizable()
//                    .aspectRatio(contentMode: .fill)   // 保证图片比例不变 -> 放大， fit： 拉伸，不放大。
//                    .frame(width: UIScreen.main.bounds.width - 80, height: isAnimate ? 600 : 200)
                .frame(height: 900)
                .offset(x: x, y: isAnimate ? 300 : 0)
                .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true))
            
        }
        
        .onAppear() {
            self.isAnimate.toggle()
        }
    }
}

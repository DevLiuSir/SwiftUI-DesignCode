//
//  ContentView.swift
//  TwitterLauncherAnimation-SwiftUI
//
//  Created by Liu Chuan on 2020/10/17.
//

import SwiftUI

struct ContentView: View {
    
    /// 是否开始动画
    @State var animate = false
    /// 是否结束动画
    @State var endAnimate = false
    
    
    var body: some View {
        
        ZStack {
            Home()
            
            ZStack {
                Color("Bg")
                Image("twitterLarge")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill :  .fit)
                    .frame(width: animate ? nil : 85, height: animate ? nil : 85, alignment: .center)
                    // 缩放视图
                    .scaleEffect(animate ? 3 : 1)
                    
                    // 设置宽度以避免尺寸过大
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animationLogo)
            
            // 完成后隐藏视图 (设置此视图的透明度)
            .opacity(endAnimate ? 0 : 1)
        }
    }
    
    
    /// 缩放 Logo 动画
    func animationLogo() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            
            // 调整需要的速度
            withAnimation(Animation.easeOut(duration: 0.45)) {
                animate.toggle()
            }
            withAnimation(Animation.easeIn(duration: 0.35)) {
                endAnimate.toggle()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Twitter")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Bg"))
                Spacer(minLength: 0)
                
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white)
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
    }
}

//
//  BackgroundView.swift
//  GestureHandle
//
//  Created by Liu Chuan on 2020/10/16.
//


import SwiftUI

struct BackgroundView : View {
    
    /// 拖拽的偏移量
    @Binding var offset: CGSize
    
    var body: some View {
        VStack {
            Text("Background View")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(EdgeInsets(top: -screenH / 3, leading: 0, bottom: 0, trailing: 10))
                .foregroundColor(.white)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
        }
        .frame(width: screenW, height: screenH + 60, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(32)
        .shadow(radius: 20)
        .edgesIgnoringSafeArea(.all)
        
        .padding(.top, 120)
        .animation(.spring())
        .offset(y: offset.height > 100 ? -60 : 0)
        .onTapGesture(perform: {
            print("单击。。。")
            self.offset = .zero
        })
    }
}

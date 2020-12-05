//
//  HomePage.swift
//  SlideOutMenu
//
//  Created by Liu Chuan on 2020/12/05.
//

import SwiftUI


struct HomePage: View {
    
    @Binding var x : CGFloat
    
    @Binding var isDark: Bool
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        x = 0      // 动画改变x值 -> 打开滑动菜单
                    }
                }) {
                    Image("UserAvatar")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                Spacer(minLength: 0)
                
                Text("消息")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    print("点击了+号")
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                })
            }
            .padding()
            .padding(.top, 20)
            .background(LinearGradient(gradient: Gradient(colors: [.purple, .green]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing))
            
            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
            Spacer()
        }
        
        //用于拖动手势...
        .contentShape(Rectangle())
        .background(self.isDark ? Color.black : Color.white)
    }
}

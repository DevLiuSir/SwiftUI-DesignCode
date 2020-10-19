//
//  LockScreen.swift
//  AppLock
//
//  Created by Liu Chuan on 2020/10/19.
//

import SwiftUI

/// 锁屏页面
struct LockScreen : View {
    
    // AppStorage: 属性包装程序类型 -> UserDefaults.  在用户单击“删除”时更改它
    @AppStorage("lock_Password") var key = "1234"
    @Binding var unLocked : Bool
    @State var password = ""
    @State var wrongPassword = false
    
    let height = UIScreen.main.bounds.width
  
    var body: some View {
        VStack{
            HStack{
                Spacer(minLength: 0)
                Menu(content: {
                    Label(
                        title: { Text("Help") },
                        icon: { Image(systemName: "info.circle.fill")})
                        .onTapGesture(perform: {
                            // perform actions...
                        })
                    Label(
                        title: { Text("Reset Password") },
                        icon: { Image(systemName: "key.fill") })
                        .onTapGesture(perform: {
                            // perform actions...
                        })
                }) {
                    Image(systemName: "gearshape.fill")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .padding()
                }
            }.padding(.leading)
            
            Image("YinYang")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.top,20)
            
            Text("Enter Your Password to Unlock")
                .font(.title3)
                .fontWeight(.heavy)
                .padding(.top,20)
            
            HStack(spacing: 20) {
                // Password Circle View...
                ForEach(0..<4,id: \.self){ index in
                    PasswordView(index: index, password: $password)
                }
            }
            // 对于较小尺寸的iPhone.
            .padding(.top,height < 750 ? 20 : 30)
            
            // 键盘....
            
            Spacer(minLength: 0)
            
            Text(wrongPassword ? "The password is incorrect" : "")
                .foregroundColor(.red)
                .fontWeight(.heavy)
            
            Spacer(minLength: 0)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3),spacing: height < 750 ? 10 : 15) {
                
                // Password Button ....
                ForEach(1...9, id: \.self){value in
                    PasswordButton(value: "\(value)",password: $password, key: $key, unlocked: $unLocked, wrongPass: $wrongPassword)
                }
                PasswordButton(value: "Cancel", password: $password, key: $key, unlocked: $unLocked, wrongPass: $wrongPassword)
                PasswordButton(value: "0", password: $password, key: $key, unlocked: $unLocked, wrongPass: $wrongPassword)
                PasswordButton(value: "delete.fill",password: $password, key: $key, unlocked: $unLocked, wrongPass: $wrongPassword)
            }
            Spacer()
            
            //.padding(.bottom)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

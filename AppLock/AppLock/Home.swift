//
//  Home.swift
//  AppLock
//
//  Created by Liu Chuan on 2020/10/19.
//

import SwiftUI


struct Home : View {
    
    @State var unLocked = false
    
    var body: some View{
        
        ZStack{
            // Lockscreen...
            if unLocked{
                Text("Successfully unlocked!")
                    .font(.title2)
                    .fontWeight(.heavy)
            }else{
                LockScreen(unLocked: $unLocked)
            }
        }
        .preferredColorScheme(unLocked ? .light : .dark)
    }
}

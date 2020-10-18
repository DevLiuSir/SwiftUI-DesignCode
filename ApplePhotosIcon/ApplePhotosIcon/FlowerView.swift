//
//  FlowerView.swift
//  ApplePhotosIcon
//
//  Created by Liu Chuan on 2020/10/19.
//

import SwiftUI

/// 花朵视图
struct FlowerView: View  {
    
    var body: some View {
        
        ZStack {
            
            CustomCapsule(color: .blue, degree: 0)
            CustomCapsule(color: .orange, degree: 180)
            
            CustomCapsule(color: .pink, degree: 90)
            CustomCapsule(color: .green, degree: -90)
            
            CustomCapsule(color: .purple, degree: 45)
            CustomCapsule(color: .green, degree: -45)
            
            CustomCapsule(color: .red, degree: 135)
            CustomCapsule(color: .yellow, degree: -135)
        }
        .scaleEffect(2.5)
    }
}

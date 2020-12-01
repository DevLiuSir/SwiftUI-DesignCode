//
//  TopView.swift
//  StretchHeadView
//
//  Created by Liu Chuan on 2020/12/2.
//

import SwiftUI

struct TopView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.green)
                .frame(height: (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 50)
                .background(Color.green)

            Text("Stretch HeadView")
                .foregroundColor(.white)
                .font(.title)
                .frame(height: 50)
        }
    }
}

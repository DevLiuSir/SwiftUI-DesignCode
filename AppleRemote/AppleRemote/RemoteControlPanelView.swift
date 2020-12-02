//
//  RemoteControlPanelView.swift
//  AppleRemote
//
//  Created by Liu Chuan on 2020/12/1.
//

import SwiftUI

/// 遥控面板视图
struct RemoteControlPanelView: View {
    
    var body: some View {
        VStack {
            TopView()
                .cornerRadius(25, corners: [.topLeft, .topRight])
            BottomView()
            Spacer()
        }
    }
}

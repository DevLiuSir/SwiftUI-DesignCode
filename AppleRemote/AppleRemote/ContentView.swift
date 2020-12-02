//
//  ContentView.swift
//  AppleRemote
//
//  Created by Liu Chuan on 2020/12/1.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height - 250)
                .overlay(RemoteControlPanelView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

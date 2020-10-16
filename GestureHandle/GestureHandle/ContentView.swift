//
//  ContentView.swift
//  GestureHandle
//
//  Created by Liu Chuan on 2020/10/16.
//

import SwiftUI

struct ContentView: View {
    
    /// 拖拽的偏移量
    @State private var offset = CGSize.zero
    
    var body: some View {
        
        ZStack {
            BackgroundView(offset: $offset)
            DragView(offset: $offset)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

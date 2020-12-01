//
//  ContentView.swift
//  StretchHeadView
//
//  Created by Liu Chuan on 2020/12/2.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        ZStack {
            
            HomeView()
        }
        .preferredColorScheme(.light)   // black tint on status bar
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

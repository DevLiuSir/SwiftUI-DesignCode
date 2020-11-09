//
//  ContentView.swift
//  Clock
//
//  Created by Liu Chuan on 2020/11/03.
//

import SwiftUI

struct ContentView: View {
    
    @State var isDark = false
    
    var body: some View {
        NavigationView {
            ClockView(isDark: $isDark, secondColor: .red,
                      dialThemeColor: Color("Color"), is12HourClock: true)
                .navigationBarHidden(true)
                .preferredColorScheme(isDark ? .dark : .light)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


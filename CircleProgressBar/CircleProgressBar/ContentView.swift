//
//  ContentView.swift
//  CircleProgressBar
//
//  Created by Liu Chuan on 2020/11/2.
//

import SwiftUI

struct ContentView: View {
    
    @State var percentage: CGFloat = 0
    @State var isDownload: Bool = false
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    PulsationView()
                    TrackView()
                    PercentageLabel(percentage: $percentage, isDownload: $isDownload)
                    OutLineView(percentage: $percentage)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

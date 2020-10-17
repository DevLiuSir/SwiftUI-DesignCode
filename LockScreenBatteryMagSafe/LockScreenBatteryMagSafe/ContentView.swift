//
//  ContentView.swift
//  LockScreenBatteryMagSafe
//
//  Created by Liu Chuan on 2019/10/18.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            HomeView().preferredColorScheme(.dark)
                .navigationBarTitle("LockScreenBattery")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

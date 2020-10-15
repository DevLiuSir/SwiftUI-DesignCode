//
//  ContentView.swift
//  Settings
//
//  Created by Liu Chuan on 2019/6/10.
//  Copyright © 2020 Liu Chuan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "airplane").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.orange).cornerRadius(6)
                            Text("Airplane Mode")
                        }
                    }
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "wifi").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.blue).cornerRadius(6)
                            Text("Wi-Fi")
                        }
                    }
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "wifi").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.blue).cornerRadius(6)
                            Text("Bluetooth")
                        }
                    }
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "antenna.radiowaves.left.and.right").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.green).cornerRadius(6)
                            Text("Cellular")
                        }
                    }
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "personalhotspot").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.green).cornerRadius(6)
                            Text("Personal Hotspot")
                        }
                    }
                    
                }
                
                Section {
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "gear").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.gray).cornerRadius(6)
                            Text("General")
                        }
                    }
                    
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "app.badge").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.red).cornerRadius(6)
                            Text("Notifications")
                        }
                    }
                    
                    
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "moon.fill").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.purple).cornerRadius(6)
                            Text("Do Not Disturb")
                        }
                    }
                    
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "battery.100").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.green).cornerRadius(6)
                            Text("Battery")
                        }
                    }
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "book.fill").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.orange).cornerRadius(6)
                            Text("Books")
                        }
                    }
                }
            }
            .navigationBarTitle("Settings")
            .listStyle(GroupedListStyle())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

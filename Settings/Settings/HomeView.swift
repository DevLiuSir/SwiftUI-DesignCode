//
//  HomeView.swift
//  Settings
//
//  Created by Liu Chuan on 2020/10/21.
//  Copyright © 2020 Liu Chuan. All rights reserved.
//

import SwiftUI


struct HomeView: View {
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "airplane").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.orange).cornerRadius(6)
                            Text("Airplane Mode")
                        }
                    }
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "wifi").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.blue).cornerRadius(6)
                            Text("Wi-Fi")
                        }
                    }
                    
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "antenna.radiowaves.left.and.right").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.green).cornerRadius(6)
                            Text("Cellular")
                        }
                    }
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "personalhotspot").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.green).cornerRadius(6)
                            Text("Personal Hotspot")
                        }
                    }
                    
                }
                
                Section {
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "app.badge").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.red).cornerRadius(6)
                            Text("Notifications")
                        }
                    }
                    
                    
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "moon.fill").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.purple).cornerRadius(6)
                            Text("Do Not Disturb")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "gear").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.gray).cornerRadius(6)
                            Text("General")
                        }
                    }
                    
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "faceid").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.green).cornerRadius(6)
                            Text("Face ID & Passcode")
                        }
                    }
                    
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "battery.100").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.green).cornerRadius(6)
                            Text("Battery")
                        }
                    }
                    
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "hand.raised.fill").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.blue).cornerRadius(6)
                            Text("Privacy")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "key.fill").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.gray).cornerRadius(6)
                            Text("Passwords & Accounts")
                        }
                    }
                    
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "envelope.fill").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.blue).cornerRadius(6)
                            Text("Mail")
                        }
                    }
                    
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "phone.fill").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.green).cornerRadius(6)
                            Text("Phone")
                        }
                    }
                    
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "message.fill").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.green).cornerRadius(6)
                            Text("Messages")
                        }
                    }
                    
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "video.fill").font(.callout).colorScheme(.dark)
                            }.frame(width: 28, height: 28).background(Color.green).cornerRadius(6)
                            Text("FaceTime")
                        }
                    }
                    
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "camera.fill").font(.callout).colorScheme(.light)
                            }.frame(width: 28, height: 28).background(Color.gray).cornerRadius(6)
                            Text("Camera")
                        }
                    }
                    
                    NavigationLink(destination: CustomDetailView(message: "Detail View")) {
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

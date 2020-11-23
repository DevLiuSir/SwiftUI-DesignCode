//
//  ItemView.swift
//  ScalingOnScrollView
//
//  Created by Liu Chuan on 2020/11/12.
//

import SwiftUI

struct ItemView: View {
    
    var item: Item
    
    var body: some View {
        HStack{
            Image(item.image)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 12) {
                Text(item.name)
                    .fontWeight(.bold)
                Text(item.description)
            }
            .padding(.leading,10)
            Spacer(minLength: 0)
        }
        .background(Color.white.shadow(color: Color.black.opacity(0.12), radius: 5, x: 0, y: 4))
        .cornerRadius(15)
    }
}

struct Item {
    var name: String
    var description: String
    var image: String
}

var items: [Item] = [
    Item(name: "Minecraft", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", image: "1"),
    Item(name: "Video games", description: "At auctor urna nunc id cursus metus aliquam. ", image: "2"),
    Item(name: "Marvel-Inspired Games", description: "Lorem ipsum dolor sit amet", image: "3"),
    Item(name: "Blast off! Rocketship Games", description: "Ultricies tristique nulla aliquet enim tortor at.", image: "4"),
        
    Item(name: "Minecraft", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", image: "1"),
    Item(name: "Video games", description: "At auctor urna nunc id cursus metus aliquam. ", image: "2"),
    Item(name: "Marvel-Inspired Games", description: "Lorem ipsum dolor sit amet", image: "3"),
    Item(name: "Blast off! Rocketship Games", description: "Ultricies tristique nulla aliquet enim tortor at.", image: "4"),
    
    Item(name: "Minecraft", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", image: "1"),
    Item(name: "Video games", description: "At auctor urna nunc id cursus metus aliquam. ", image: "2"),
    Item(name: "Marvel-Inspired Games", description: "Lorem ipsum dolor sit amet", image: "3"),
    Item(name: "Blast off! Rocketship Games", description: "Ultricies tristique nulla aliquet enim tortor at.", image: "4"),
]

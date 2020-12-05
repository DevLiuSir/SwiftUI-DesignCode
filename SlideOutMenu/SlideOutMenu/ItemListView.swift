//
//  ItemListView.swift
//  SlideOutMenu
//
//  Created by Liu Chuan on 2020/12/05.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var title: String
    var image: String
}

struct ItemRow: View {
    var item: Item
    var body: some View {
        HStack {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 25, height: 25)
            Text(item.title)
                .font(.callout)
        }
    }
}

struct ItemListView: View {
    
    @Binding var dark: Bool
    
    var items: [Item] = [
        Item(title: "我的超级会员", image: "vip_shadow"),
        Item(title: "QQ钱包", image: "sidebar_purse"),
        Item(title: "个性装扮", image: "sidebar_decoration"),
        Item(title: "我的收藏", image: "sidebar_favorit"),
        Item(title: "我的相册", image: "sidebar_album"),
        Item(title: "我的文件", image: "sidebar_file"),
        Item(title: "免流量特权", image: "sidebar_freetraffic")
    ]
    
    var body: some View {
        VStack {
            List(items, id: \.title) { thisItem in
                ItemRow(item: thisItem)
                    .foregroundColor(self.dark ? .white : .black)
                    .frame(height: 50)
                
                NavigationLink(destination: EmptyView()) {
                    EmptyView()
                }
            }
        }
        .colorScheme(self.dark ? .dark : .light)
    }
}

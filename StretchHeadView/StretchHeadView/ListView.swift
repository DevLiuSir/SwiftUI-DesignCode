//
//  ListView.swift
//  StretchHeadView
//
//  Created by Liu Chuan on 2020/12/2.
//

import SwiftUI

struct ListView: View {
    /// 数据行数 （默认： 20条）
    @State var listCout: Int = 20
    
    var body: some View {
        ForEach(0 ..< listCout) { id in
            List {
                Text("\(id)")
                    .font(.title2)
            }
            .frame(width: screenW, height: 50, alignment: .center)
        }
    }
}

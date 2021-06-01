//
//  MessageView.swift
//  demoSwiftui
//
//  Created by Mac on 01/05/21.
//

import SwiftUI

struct MessageView: View {    
    let items = 1...50
    let rows = [
           GridItem(.fixed(50)),
           GridItem(.fixed(50))
       ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .center) {
                ForEach(items, id: \.self) { item in
                    Image(systemName: "\(item).circle.fill")
                        .font(.largeTitle)
                }
            }
            .frame(height: 150)
        }
    }
}

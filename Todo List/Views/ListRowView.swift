//
//  ListRowView.swift
//  Todo List
//
//  Created by Sajan Lawrence on 06/09/25.
//

import SwiftUI

struct ListRowView: View {
    var item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout){
    let item1 = ItemModel(title: "First Item!", isCompleted: false)
    let item2 = ItemModel(title: "Second Item!", isCompleted: true)
    Group{
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
}

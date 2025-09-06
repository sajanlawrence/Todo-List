//
//  ListView.swift
//  Todo List
//
//  Created by Sajan Lawrence on 06/09/25.
//

import SwiftUI

struct ListView: View {
    @State private var items: [ItemModel] = [
        ItemModel(title: "First Item", isCompleted: false),
        ItemModel(title: "Second Item", isCompleted: true),
        ItemModel(title: "Third Item", isCompleted: false),
    ]
    var body: some View {
        NavigationStack{
            List{
                ForEach(items) { item in
                    ListRowView(item: item)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Todo List")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem {
                    NavigationLink("Add") {
                        AddView()
                    }
                }
            }
        }
    }
}

#Preview {
    ListView()
}

//
//  ListView.swift
//  Todo List
//
//  Created by Sajan Lawrence on 06/09/25.
//

import SwiftUI

struct ListView: View {
    @State private var items: [String] = [
        "This is the first title!",
        "This is the second!",
        "Third!"
    ]
    var body: some View {
        NavigationStack{
            List{
                ForEach(items, id: \.self) { item in
                    ListRowView(title: item)
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

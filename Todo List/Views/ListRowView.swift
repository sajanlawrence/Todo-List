//
//  ListRowView.swift
//  Todo List
//
//  Created by Sajan Lawrence on 06/09/25.
//

import SwiftUI

struct ListRowView: View {
    @State var title: String
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(title)
        }
    }
}

#Preview {
    ListRowView(title: "This is the first title!")
}

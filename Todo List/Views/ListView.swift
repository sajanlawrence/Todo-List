//
//  ListView.swift
//  Todo List
//
//  Created by Sajan Lawrence on 06/09/25.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var editMode: EditMode = .inactive
    var body: some View {
        ZStack{
            if !listViewModel.items.isEmpty{
                List{
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(.plain)
            }else{
                NoItemsView()
                    .transition(
                        .asymmetric(
                            insertion: .opacity.animation(.easeIn(duration: 2.5)),
                            removal: .opacity.animation(.easeOut(duration: 0.0))
                        )
                    )
            }
            //        .overlay {
            //            if listViewModel.items.isEmpty{
            //                ContentUnavailableView("No items found", systemImage: "tray", description: Text("Please use the Add button in the top right corner to add your todo items"))
            //            }
        }
        .navigationTitle("Todo List")
        .toolbar {
            if !listViewModel.items.isEmpty{
                ToolbarItem(placement: .topBarLeading) {
                    Button(editMode == .active ? "Done" : "Edit") {
                        withAnimation {
                            editMode = editMode == .active ? .inactive : .active
                        }
                    }
                }
            }
            
            ToolbarItem {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
        .environment(\.editMode, $editMode)
    }
    
}


#Preview {
    NavigationStack{
        ListView()
            .environmentObject(ListViewModel())
    }
}

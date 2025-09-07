//
//  ListViewModel.swift
//  Todo List
//
//  Created by Sajan Lawrence on 07/09/25.
//

import Foundation

class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title: "First Item", isCompleted: false),
            ItemModel(title: "Second Item", isCompleted: true),
            ItemModel(title: "Third Item", isCompleted: false),
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(at offset: IndexSet){
        items.remove(atOffsets: offset)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}

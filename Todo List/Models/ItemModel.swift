//
//  ItemModel.swift
//  Todo List
//
//  Created by Sajan Lawrence on 06/09/25.
//

import Foundation

struct ItemModel: Identifiable, Codable, Equatable{
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

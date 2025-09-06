//
//  ItemModel.swift
//  Todo List
//
//  Created by Sajan Lawrence on 06/09/25.
//

import Foundation

struct ItemModel: Identifiable{
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}

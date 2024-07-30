//
//  ListItem.swift
//  CommuterList
//
//  Created by Christopher Cordero on 7/24/24.
//

import Foundation

class ListItem: ObservableObject, Identifiable {
    
    var name: String
    var category: String// Category (enum)
    var date: Date?
    var id: UUID
    @Published var completed: Bool
    
    init(name: String, category: String, date: Date? = nil, completed: Bool?=nil) {
        self.id = UUID()
        self.name = name
        self.category = category
        self.date = date
        self.completed = completed ?? false
    }
}

//
//  Task.swift
//  ToDoApp
//
//  Created by Daniil Belyaev on 22.06.2021.
//

import Foundation

struct Task {
    let title: String
    let description: String?
    var date: Date?
    let location: Location?
    
    
    init(title: String, description: String? = nil, location: Location? = nil, date: Date? = nil) {
        self.title = title
        self.description = description
        self.date = Date()
        self.location = location
        self.date = date ?? Date()
    }
}

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        if lhs.title == rhs.title,
           lhs.description == rhs.description,
           lhs.location == rhs.location {
            return true
        }
        return false
    }
}

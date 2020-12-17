//
//  DailyStandUp.swift
//  ZingUp
//
//  Created by Scott on 12/16/20.
//

import SwiftUI

struct DailyStandUp: Identifiable {
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, color: Color) {
            self.id = id
            self.title = title
            self.attendees = attendees
            self.lengthInMinutes = lengthInMinutes
            self.color = color
        }
}

extension DailyStandUp {
    static var data: [DailyStandUp] {
        [
            DailyStandUp(title: "Product", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, color: Color("Product")),
            DailyStandUp(title: "Design", attendees: ["Doug", "Sherry", "Jill", "Ted"], lengthInMinutes: 15, color: Color("Design")),
            DailyStandUp(title: "iOS Dev", attendees: ["Scott", "Kumar", "Lori"], lengthInMinutes: 12, color: Color("iOS Dev")),
            DailyStandUp(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Carla", "Chad", "Jen", "Sarah"], lengthInMinutes: 5, color: Color("Web Dev"))
        ]
    }
}

extension DailyStandUp {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5.0
        var color: Color = .primary
    }
    
    var data: Data {
        return Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), color: color)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        color = data.color
    }
}

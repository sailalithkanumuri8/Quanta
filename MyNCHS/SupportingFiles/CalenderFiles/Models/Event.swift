//
//  Event.swift
//  Quanta
//
//  Created by SaiLalith Kanumuri on 12/17/22.
//

import SwiftUI

// This is each individual event
struct Event: Identifiable {
    enum EventType: String, Identifiable, CaseIterable {
        case school, home, social, sport, unspecified
        var id: String {
            self.rawValue
        }

        // All the event types
        var icon: String {
            switch self {
            case .school:
                return "📚"
            case .home:
                return "🏠"
            case .social:
                return "🎉"
            case .sport:
                return "🏏"
            case .unspecified:
                return "📌"
            }
        }
    }

    var eventType: EventType
    var date: Date
    var note: String
    var id: String
    
    // Defines what a date should be
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }

    init(id: String = UUID().uuidString, eventType: EventType = .unspecified, date: Date, note: String) {
        self.eventType = eventType
        self.date = date
        self.note = note
        self.id = id
    }

    // All the events preloaded into the calendar
    static var sampleEvents: [Event] {
        return [
            Event(eventType: .school, date: Date().diff(numDays: -1), note: "Early release wednesday"),
            Event(eventType: .social, date: Date().diff(numDays: -1), note: "FBLA Day 1"),
            Event(eventType: .social, date: Date().diff(numDays: 0), note: "FBLA Day 2"),
            Event(eventType: .social, date: Date().diff(numDays: 1), note: "FBLA Day 3"),
            Event(eventType: .social, date: Date().diff(numDays: 2), note: "FBLA Day 4"),
            Event(eventType: .school, date: Date().diff(numDays: 6), note: "Early release wednesday"),
            Event(eventType: .social, date: Date().diff(numDays: 0), note: "FBLA Mobile Application Development Presentation"),
            Event(eventType: .school, date: Date().diff(numDays: 11), note: "Advanced Placement Testing Starts"),
            Event(eventType: .sport, date: Date().diff(numDays: 5), note: "Varsity Girls Golf vs. Eastlake"),
            Event(eventType: .sport, date: Date().diff(numDays: 5), note: "Varsity Girls Tennis vs. Woodinville"),
            Event(eventType: .sport, date: Date().diff(numDays: 0), note: "Varsity Track vs. Inglemoor"),
            Event(eventType: .sport, date: Date().diff(numDays: 4), note: "Varsity Boys Baseball vs. Inglemoor"),
            Event(eventType: .sport, date: Date().diff(numDays: 0), note: "Varsity Girls Tennis vs. Inglemoor"),
            Event(eventType: .school, date: Date().diff(numDays: 0), note: "Varsity Boys Soccer vs. Woodinville"),
            Event(eventType: .sport, date: Date().diff(numDays: 1), note: "Varsity Girls Softball vs. Skyline"),
            Event(eventType: .sport, date: Date().diff(numDays: 1), note: "Varsity Boys Baseball vs. Mount Si"),
            Event(eventType: .school, date: Date().diff(numDays: 8), note: "AP Procters Needed"),
            Event(eventType: .school, date: Date().diff(numDays: 7), note: "Cap and Gown Delivery - Seniors"),
            Event(eventType: .school, date: Date().diff(numDays: 11), note: "AP Government & Politics Final Exam"),
            Event(eventType: .school, date: Date().diff(numDays: 5), note: "AP Statistics Final Exam"),
            Event(eventType: .school, date: Date().diff(numDays: 5), note: "AP Calculus BC Final Exam"),
            Event(eventType: .school, date: Date().diff(numDays: 13), note: "Early release wednesday"),
            Event(eventType: .school, date: Date().diff(numDays: 20), note: "Early release wednesday"),
            Event(eventType: .school, date: Date().diff(numDays: 27), note: "Early release wednesday"),
        ]
    }
}

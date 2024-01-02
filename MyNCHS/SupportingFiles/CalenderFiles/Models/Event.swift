//
//  Event.swift
//  MyNCHS
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
            //Event(eventType: .home, date: dateFormatter.date(from: "12/16/2022")!, note: "Winter break starts"),
            Event(eventType: .school, date: Date().diff(numDays: -3), note: "Early release wednesday"),
            Event(eventType: .social, date: Date().diff(numDays: 0), note: "FBLA North Creek Champions Challenge"),
            Event(eventType: .school, date: Date().diff(numDays: 4), note: "Early release wednesday"),
            Event(eventType: .social, date: Date().diff(numDays: 0), note: "FBLA Mobile Application Development Presentation"),
            Event(eventType: .school, date: Date().diff(numDays: 11), note: "AP Government & Politics Final Exam"),
            Event(eventType: .school, date: Date().diff(numDays: 5), note: "AP Statistics Final Exam"),
            Event(eventType: .school, date: Date().diff(numDays: 5), note: "AP Calculus BC Final Exam"),
            Event(eventType: .school, date: Date().diff(numDays: 20), note: "Last day of Semester"),
            Event(eventType: .school, date: Date().diff(numDays: 11), note: "Early release wednesday"),
            Event(eventType: .school, date: Date().diff(numDays: 18), note: "Early release wednesday"),
            Event(eventType: .school, date: Date().diff(numDays: 25), note: "Early release wednesday"),
        ]
    }
}

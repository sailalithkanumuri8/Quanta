//
//  EventStore.swift
//  Quanta
//
//  Created by SaiLalith Kanumuri on 12/17/22.
//

import SwiftUI

@MainActor
// Includes all of the events
class EventStore: ObservableObject {
    @Published var events = [Event]()
    @Published var preview: Bool
    @Published var changedEvent: Event?
    @Published var movedEvent: Event?

    init(preview: Bool = false) {
        self.preview = preview
        fetchEvents()
    }

    // Gets all of the events
    func fetchEvents() {
        if preview {
            events = Event.sampleEvents
        } else {
            
        }
    }

    // When asked, deletes an event
    func delete(_ event: Event) {
        if let index = events.firstIndex(where: {$0.id == event.id}) {
            changedEvent = events.remove(at: index)
        }
    }

    // When asked, addes an new event
    func add(_ event: Event) {
        events.append(event)
        changedEvent = event
    }

    // Updates the events
    func update(_ event: Event) {
        if let index = events.firstIndex(where: {$0.id == event.id}) {
            movedEvent = events[index]
            events[index].date = event.date
            events[index].note = event.note
            events[index].eventType = event.eventType
            changedEvent = event
        }
    }

}

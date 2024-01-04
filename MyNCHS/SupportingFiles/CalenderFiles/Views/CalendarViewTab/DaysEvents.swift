//
//  DaysEvents.swift
//  Quanta
//
//  Created by SaiLalith Kanumuri on 12/17/22.
//

import SwiftUI

struct DaysEventsListView: View {
    @EnvironmentObject var eventStore: EventStore
    @Binding var dateSelected: DateComponents?
    @State private var formType: EventFormType?
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                Group {
                    // If an event is selected, based on the user request, it will delete an event
                    if let dateSelected {
                        let foundEvents = eventStore.events
                            .filter {$0.date.startOfDay == dateSelected.date!.startOfDay}
                        List {
                            ForEach(foundEvents) { event in
                                ListViewRow(event: event, formType: $formType)
                                    .swipeActions {
                                        Button(role: .destructive) {
                                            eventStore.delete(event)
                                        } label: {
                                            Image(systemName: "trash")
                                        }
                                    }
                                    .sheet(item: $formType) { $0 }
                            }
                        }
                    }
                }
                .navigationTitle(dateSelected?.date?.formatted(date: .long, time: .omitted) ?? "")
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

// This has what all the events should have
// All the day events HAVE this
struct DaysEventsListView_Previews: PreviewProvider {
    static var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: Date())
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }
    
    static var previews: some View {
        DaysEventsListView(dateSelected: .constant(dateComponents))
            .environmentObject(EventStore(preview: true)
            )
    }
}

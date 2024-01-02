//
//  EventFormView.swift
//  MyNCHS
//
//  Created by SaiLalith Kanumuri on 12/17/22.
//

import SwiftUI

// To make a new event, it runs this
struct EventFormView: View {
    @EnvironmentObject var eventStore: EventStore
    @StateObject var viewModel: EventFormViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var focus: Bool?
    
    let notify = NotificationHandler()
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack {
                    // This is the date picker
                    Form {
                        DatePicker(selection: $viewModel.date) {
                            Text("Date and Time")
                        }
                        // Note
                        TextField("Note", text: $viewModel.note, axis: .vertical)
                            .focused($focus, equals: true)
                        // Event type
                        Picker("Event Type", selection: $viewModel.eventType) {
                            ForEach(Event.EventType.allCases) {eventType in
                                Text(eventType.icon + " " + eventType.rawValue.capitalized)
                                    .tag(eventType)
                            }
                        }
                        Section(footer:
                                    HStack {
                            Spacer()
                            Button {
                                // To update the event
                                if viewModel.updating {
                                    // update this event
                                    let event = Event(id: viewModel.id!,
                                                      eventType: viewModel.eventType,
                                                      date: viewModel.date,
                                                      note: viewModel.note)
                                    eventStore.update(event)
                                    
                                    notify.sendNotification(date: viewModel.date,
                                                            type: "date",
                                                            title: viewModel.note,
                                                            body: viewModel.eventType.rawValue.capitalizingFirstLetter())
                                } else {
                                    // To create new event
                                    let newEvent = Event(eventType: viewModel.eventType,
                                                         date: viewModel.date,
                                                         note: viewModel.note)
                                    eventStore.add(newEvent)
                                    
                                    notify.sendNotification(date: viewModel.date,
                                                            type: "date",
                                                            title: viewModel.note,
                                                            body: viewModel.eventType.rawValue.capitalizingFirstLetter())
                                }
                                dismiss()
                            } label: {
                                Text(viewModel.updating ? "Update Event" : "Add Event")
                            }
                            // To create the button
                            .buttonStyle(.borderedProminent)
                            .disabled(viewModel.incomplete)
                            Spacer()
                        }
                        ) {
                            EmptyView()
                        }
                    }
                }
                .navigationTitle(viewModel.updating ? "Update" : "New Event")
                .onAppear {
                    focus = true
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct EventFormView_Previews: PreviewProvider {
    static var previews: some View {
        EventFormView(viewModel: EventFormViewModel())
            .environmentObject(EventStore())
    }
}

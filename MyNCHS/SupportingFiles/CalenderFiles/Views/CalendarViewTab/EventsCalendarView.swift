//
//  EventsCalendarView.swift
//  MyNCHS
//
//  Created by SaiLalith Kanumuri on 12/17/22.
//

import SwiftUI
import GoogleSignIn

// Displays the calender with all the data from the events
struct EventsCalendarView: View {
    @EnvironmentObject var eventStore: EventStore
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false
    @State private var formType: EventFormType?
    
    @State var showWebView = false
    @State var showWebView2 = false
    
    private let user = GIDSignIn.sharedInstance.currentUser
    
    var body: some View {
        if #available(iOS 16.0, *) {
            // Displays the calendar
            NavigationStack {
                ScrollView {
                    VStack {
                        HStack {
                            Text("Calendar")
                                .font(Font.custom("Quicksand-Bold", size: 30))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(15)
                                .offset(x: 5, y: 10)

                            Spacer()
                            
                            // Allows access to add new events
                            Button {
                                formType = .new
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .imageScale(.large)
                                    .foregroundColor(Color("Color"))
                            }
                            .offset(x: -140, y: 12)
                            
                            Spacer()
                            
                            // Profile image of the user from Google Sign In
                            NavigationLink(destination: Info(isCalendar: true)) {
                                NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .cornerRadius(30)
                                    .offset(x: -20, y: 10)
                            }
                        }
                    }
                    
                    // Runs CalendarView which has events
                    CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture),
                                 eventStore: eventStore,
                                 dateSelected: $dateSelected,
                                 displayEvents: $displayEvents)
                    .padding(.top, 5)

                }
                .sheet(item: $formType) { $0 }
                .sheet(isPresented: $displayEvents) {
                    DaysEventsListView(dateSelected: $dateSelected)
                        .presentationDetents([.medium, .large])
                }
                .background(Color.gray.opacity(0.1).frame(width: 500, height: 1000))
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct EventsCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        EventsCalendarView()
            .environmentObject(EventStore(preview: true))
    }
}

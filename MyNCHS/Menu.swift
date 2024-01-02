//
//  Menu.swift
//  Vista
//
//  Created by SaiLalith Kanumuri on 12/23/23.
//

import SwiftUI

// This is the menu bar
// This will always keep a look out for user actions like pressing on the menu
struct Menu: View {
    // What button on the menu the user pressed on
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            // When clicked on this button, it will go to the home page
            Home().navigationTitle("x")
                .tabItem {
                    if selection == 0 {
                        Image(systemName: "house.fill")
                    } else {
                        Image(systemName: "house")
                    }
                }.tag(0)

            // When clicked on this button, it will go to the people page
            People().navigationTitle("x")
                .tabItem {
                    if selection == 1 {
                        Image(systemName: "network")
                    } else {
                        Image(systemName: "network")
                    }
                }.tag(1)
            

            // When clicked on this button, it will go to the calendar
            Calender().navigationTitle("x")
                .tabItem {
                    if selection == 1 {
                        Image(systemName: "calendar")
                    } else {
                        Image(systemName: "calendar")
                    }
                }.tag(2)
            
            // When clicked on this button, it will go to the messages page
            ChatList().navigationTitle("x")
                .tabItem {
                    if selection == 1 {
                        Image(systemName: "message.fill")
                    } else {
                        Image(systemName: "message")
                    }
                }.tag(3)

            // When clicked on this button, it will go to the portfolio page
            Portfolio().navigationTitle("x")
                .tabItem {
                    if selection == 4 {
                        Image(systemName: "person.fill")
                    } else {
                        Image(systemName: "person")
                    }
                }.tag(4)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

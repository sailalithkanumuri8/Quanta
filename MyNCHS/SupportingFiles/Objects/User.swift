//
//  User.swift
//  Vista
//
//  Created by SaiLalith Kanumuri on 12/21/23.
//

import SwiftUI

// This is the class for each individual user in the app
// All the users where the user can network with use this class
class User {
    //Atributes
    var name: String
    var email: String
    var projects: [Item]
    var honors: [Item]
    var athletics: [Item]
    var arts: [Item]
    var clubs: [Item]
    var service: [Item]
    var honor_classes: [Item]

    // Initalizes the user based on the attributes
    init(name: String, email: String, projects: [Item] = [], honors: [Item] = [], athletics: [Item] = [], arts: [Item] = [], clubs: [Item] = [], service: [Item] = [], honor_classes: [Item] = []) {
        self.name = name
        self.email = email
        self.projects = projects
        self.honors = honors
        self.athletics = athletics
        self.arts = arts
        self.clubs = clubs
        self.service = service
        self.honor_classes = honor_classes
    }
}

// Each individual item in the People struct
struct Item: Identifiable {
    var id = UUID()
    var title: String
    var description: String
}

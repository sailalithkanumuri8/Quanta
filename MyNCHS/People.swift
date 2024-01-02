//
//  People.swift
//  Vista
//
//  Created by SaiLalith Kanumuri on 12/22/23.
//

import SwiftUI
import GoogleSignIn

struct People: View {
    // Current instance of the user
    private let user = GIDSignIn.sharedInstance.currentUser
    
    // All of the user's data
    @ObservedObject private var userData = UserData()
    
    @State private var searchText = ""
    
    // This allows names to be searchable
    var filteredUsers: [User] {
        guard !searchText.isEmpty else { return userData.users }
        return userData.users.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    // Allows linkup with Firebase datastore
    var messagesManagers: [MessagesManager] = [
        MessagesManager(collectionName: "Manvith Kothapalli"), MessagesManager(collectionName: "Bryan Nie"),
        MessagesManager(collectionName: "Rithin Karthik"), MessagesManager(collectionName: "Dhanush Eashwar"),
        MessagesManager(collectionName: "Bhanu Pedarla"), MessagesManager(collectionName: "Harshith Gorthy"),
        MessagesManager(collectionName: "Nikhil Bandaru")
    ]
    
    var body: some View {
        NavigationView {
            // Page layout
            ScrollView {
                VStack {
                    HStack {
                        Text("Network")
                            .font(Font.custom("Quicksand-Bold", size: 30))
                            .frame(width: 340, alignment: .leading)
                            .offset(x: 25)
                            .padding(.bottom, 10)
                            .padding(.top, 25)
                        
                        Spacer()
                        
                        // User profile image
                        NavigationLink(destination: Info(isCalendar: false)) {
                            NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50, alignment: .center)
                                .cornerRadius(30)
                                .offset(x: -22, y: 8)
                        }
                    }
                    
                    // Search bar which dynamically changes the items below it
                    SearchBar(searchText: $searchText)
                        .padding(.bottom, 8)
                    
                    // All the items below the search to by dynamically changed
                    ForEach(filteredUsers.indices, id: \.self) { index in
                        let user = filteredUsers[index]

                        // For every user, it outputs this to the screen
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text(user.name)
                                    .foregroundColor(.black)
                                    .frame(width: 200, alignment: .leading)
                                    .font(Font.custom("Quicksand-Bold", size: 18))

                                // Link to the direct messages
                                NavigationLink(destination: MessageView(messagesManager: messagesManagers[index], name: user.name, email: user.email)) {
                                    Image(systemName: "message.fill")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color("Light Blue"))
                                        .cornerRadius(20)
                                }

                                // Link to the user's profile
                                NavigationLink(destination: UserDetailsView(user: user)) {
                                    Image(systemName: "person.crop.circle.fill")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color("Color"))
                                        .cornerRadius(20)
                                }
                            }
                            .frame(width: 355, height: 80)
                            .background(Color.white)
                            .cornerRadius(20)
                            .navigationBarBackButtonHidden(true)
                        }
                        .padding(.bottom, 8)
                    }
                    .padding(.horizontal, 15)
                }
            }
            .background(Color.gray.opacity(0.1).frame(width: 500, height: 1000))
        }
    }
}

// struct to make the search bar, which has a text field and dynmaically changes text
struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(.white)
                .cornerRadius(10)
                .frame(width: 315, height: 50)
            
            Button {
                searchText = ""
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 5)
        }
    }
}

// This is the user's profile page when clicked
struct UserDetailsView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                Text(user.name + "'s Portfolio")
                    .font(Font.custom("Quicksand-Bold", size: 30))
                    .frame(width: 340, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 3)
                    .padding(.top, 7)
                
                Text(user.email)
                    .font(Font.custom("Quicksand-Medium", size: 15))
                    .frame(width: 340, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 15)
                
                // All the types of accomplishments a user has
                // Collects data from userData, which People gives to this struct
                AccomplishmentsSection(title: "Projects", items: user.projects)
                AccomplishmentsSection(title: "Honors", items: user.honors)
                AccomplishmentsSection(title: "Athletics", items: user.athletics)
                AccomplishmentsSection(title: "Arts", items: user.arts)
                AccomplishmentsSection(title: "Clubs & Organizations", items: user.clubs)
                AccomplishmentsSection(title: "Community Service", items: user.service)
                AccomplishmentsSection(title: "Honor Classes", items: user.honor_classes)
            }
        }
        .background(Color.gray.opacity(0.1).frame(width: 500, height: 1000))
    }
}

// This outputs each individual portion of the profile
struct AccomplishmentsSection: View {
    let title: String
    // Takes list to output the accomplishments from userData
    let items: [Item]
    
    @State private var showActivities: Bool = false
    
    var body: some View {
        // Only outputs if there are activities
        if !items.isEmpty {
            VStack {
                HStack {
                    Text(title)
                        .font(Font.custom("Quicksand-Bold", size: 25))
                        .frame(width: 320, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .offset(x: 35)
                    
                    if showActivities {
                        Image(systemName: "chevron.down")
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                            .padding(5)
                            .background(Color("Color"))
                            .cornerRadius(20)
                            .padding(.trailing, 37)
                    } else {
                        Image(systemName: "chevron.forward")
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                            .padding(5)
                            .background(Color("Color"))
                            .cornerRadius(20)
                            .padding(.trailing, 37)
                    }
                }
                .onTapGesture {
                    // enables animation
                    withAnimation {
                        showActivities.toggle()
                    }
                }
                
                // Content for each activity
                if showActivities {
                    ForEach(items) { item in
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(Font.custom("Quicksand-Regular", size: 20))
                                .frame(width: 330, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            
                            Text(item.description)
                                .font(Font.custom("Quicksand-Medium", size: 15))
                                .foregroundColor(.gray)
                                .frame(width: 300, alignment: .leading)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .frame(width: 330)
            .padding(12)
            .background(Color("Light Blue"))
            .cornerRadius(20)
            .padding(.bottom, 10)
        }
    }
}


// All the data for the user
class UserData: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        let user1 = User(name: "Manvith Kothapalli",
                         email: "manvithkothapalli@gmail.com",
                         projects: [Item(title: "GreenAct", description: "Planted 500 trees in the North Creek region"), Item(title: "FBLA Mobile Application Development", description: "Created mobile app for portfolio")],
                         honors: [Item(title: "President's Service Award", description: "Award for volunteer service excellence")],
                         athletics: [Item(title: "Cricket", description: "Played in regionals")],
                         clubs: [Item(title: "NHS", description: "Aims to aspire youth to serve their communities"), Item(title: "FBLA", description: "Researched on business topics and created app")],
                         service: [Item(title: "Learnable Organization", description: "Tutored 1,000+ students on AP Calculus, Python, and Astronomy")],
                         honor_classes: [Item(title: "AP World History", description: "AP Exam: 4/5"), Item(title: "AP Calculus AB", description: "AP Exam: 5/5"), Item(title: "AP Physics 1", description: "AP Exam: 4/5")]
        )
        
        let user2 = User(name: "Bryan Nie",
                         email: "bryannie@gmail.com",
                         projects: [Item(title: "FBLA Mobile Application Development", description: "Created mobile app for portfolio")],
                         honors: [Item(title: "President's Service Award", description: "Award for volunteer service excellence")],
                         athletics: [Item(title: "Tennis", description: "Playing Tennis for the past 10 years")],
                         arts: [Item(title: "Graphic Design", description: "Done graphic design for 10+ years using 5+ industry-leading softwares")],
                         clubs: [Item(title: "NHS", description: "Aims to aspire youth to serve their communities"), Item(title: "FBLA", description: "Researched on business topics and created app")],
                         service: [Item(title: "Bothell Food Bank", description: "Helped serve food to 5,000+ people")],
                         honor_classes: [Item(title: "AP Biology", description: "AP Exam: 4/5"), Item(title: "AP Calculus AB", description: "AP Exam: 3/5"), Item(title: "AP Physics 1", description: "AP Exam: 3/5")]
        )
        
        let user3 = User(name: "Rithin Kartik",
                         email: "rithinkarthik@gmail.com",
                         projects: [Item(title: "FBLA International Business", description: "Competed in role play event with 15 other ocmpetitors")],
                         athletics: [Item(title: "Tennis", description: "Playing Tennis for the past 2 years")],
                         arts: [Item(title: "Theater", description: "Performed Wizard of Ox with 10,000+ people as audience")],
                         clubs: [Item(title: "NHS", description: "Aims to aspire youth to serve their communities"), Item(title: "FBLA", description: "Researched on business topics and created app")],
                         honor_classes: [Item(title: "AP Phsyics 1", description: "AP Exam: 3/5"), Item(title: "AP World History", description: "AP Exam: 4/5")]
        )
        
        let user4 = User(name: "Dhanush Eashwar",
                         email: "dhanusheashwar@gmail.com",
                         projects: [Item(title: "FBLA Coding", description: "Built app to manage events for local businessed"), Item(title: "Built an AI", description: "AI makes it easier for students to take notes during long lectures")],
                         honors: [Item(title: "1st Place Seattle Hackathon", description: "Developed the best website in the Hackathon with 100 participants")],
                         clubs: [Item(title: "TSA", description: "Vice President of a club that focues on technology"), Item(title: "FBLA", description: "Researched machine learning and created app")],
                         honor_classes: [Item(title: "AP Calculus AB", description: "AP Exam: 5/5"), Item(title: "AP Physics 1", description: "AP Exam: 4/5"), Item(title: "AP Physics 2", description: "AP Exam: 4/5"), Item(title: "AP World History", description: "Exam: 5/5")]
        )
        
        let user5 = User(name: "Bhanu Paderla",
                         email: "bhanupaderla@gmail.com",
                         projects: [Item(title: "FBLA Supply Chain Management", description: "Researched and learned about complex supply chain arcitectures and applied them to real situations")],
                         honors: [Item(title: "President's Service Award", description: "Award for volunteer service excellence")],
                         clubs: [Item(title: "NHS", description: "Aims to aspire youth to serve their communities"), Item(title: "FBLA", description: "Researched on business topics for 4 years of high school")],
                         honor_classes: [Item(title: "AP Biology", description: "AP Exam: 4/5"), Item(title: "AP Engish Language", description: "AP Exam: 3/5"), Item(title: "AP Physics 1", description: "AP Exam: 3/5")]
        )
        
        let user6 = User(name: "Harshith Gorthy",
                         email: "harshithgorthy@gmail.com",
                         projects: [Item(title: "FBLA", description: "Presents business topics"), Item(title: "NHS", description: "Aims to aspire youth to serve their communities")],
                         honors: [Item(title: "President's Service Award", description: "Award for volunteer service excellence")],
                         athletics: [Item(title: "Tennis", description: "Playing Tennis for the past 10 years")]
        )
        
        let user7 = User(name: "Nikhil Bandaru",
                         email: "nikhilbandaru@gmail.com",
                         projects: [Item(title: "FBLA", description: "Presents business topics"), Item(title: "NHS", description: "Aims to aspire youth to serve their communities")],
                         honors: [Item(title: "President's Service Award", description: "Award for volunteer service excellence")],
                         athletics: [Item(title: "Tennis", description: "Playing Tennis for the past 10 years")]
        )
        
        users = [user1, user2, user3, user4, user5, user6, user7]
    }
}

struct People_Previews: PreviewProvider {
    static var previews: some View {
        People()
    }
}
